-- 一些基本的配置
-- 注册mode

local utils = core.utils
local hook = core.mode.hook
local bind = utils.bind
local uv = vim.loop

require("config.mode_list")

-- 设置lsp相关的sign

local sign = { Error = '', Hint = 'ﴞ', Info = '', Warn = '', }
for name_, text_ in pairs(sign) do
  local set_sign = vim.fn.sign_define
  local temp = "DiagnosticSign" .. name_
  set_sign(temp, {text = text_, texthl = temp, numhl = 'DiagnosticDefault' .. name_})
end

-- local diagnostic = {
--   virtual_text = {
--     prefix = "",
--   },
--   float = true
-- }

for i = 1, 9 do
  local lhs = "<leader>" .. i
  local rhs = i .. "<C-w>w"
  vim.keymap.set("n", lhs, rhs, { desc = "Move to window " .. i })
end

-- 

vim.api.nvim_create_autocmd({"BufNewFIle"}, {
  pattern = "*.cpp",
  command = "0read ~/skeleton.cpp",
})

-- 设置在linux下的剪切板

hook(linux_mode, bind(utils.load_config, {
  g = {
    clipboard = {
      ["name"] = "win32yank-wsl",
      ["copy"] = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
      },
      ["paste"] = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
      },
      ["cache_enabled"] = 0,
    },
  },
}))

-- 相当于默认配置
hook(normal_mode, bind(utils.load_config, {
  o = {
    number 	          = false,
    relativenumber    = false,
    expandtab         = true,
    smartindent       = true,
    autoindent        = true,
    wrap              = false,
    cul               = true,
    tabstop           = 2,
    mouse             = "a",
    undofile          = true,
    shiftwidth        = 2,
    termguicolors     = true,
    backup            = false,
    expandtab         = true,
    hlsearch          = false,
    backup            = true,
    updatetime        = 1000,
    signcolumn        = "yes",
    cinoptions        = "g0l1Ls(0",
  }
}))

-- 相当于针对每个hook的特殊配置
hook(code_mode, bind(utils.load_config, {
  wo = {
    number 	          = true,
    relativenumber    = true,
    wrap              = false,
  }
}))

hook(markdown_mode, bind(utils.load_config, {
  wo = {
    wrap              = true,
    number 	          = true,
  }
}))

hook(help_mode, bind(utils.load_config, {
  wo = {
    wrap              = true,
  }
}))

local test = nil

hook(cpp_buf_mode, function()
  print("set key map")
  -- 设置断点
  pcall(vim.api.nvim_buf_del_keymap, 0, "n", "<C-s>b")
  vim.api.nvim_buf_set_keymap(0, "n", "<C-s>b", "", {noremap = true, silent = true, callback = function ()
    require("dap").toggle_breakpoint()
  end})
  -- 开始调试
  pcall(vim.api.nvim_buf_del_keymap, 0, "n", "<C-s>n")
  vim.api.nvim_buf_set_keymap(0, "n", "<C-s>n", "", {noremap = true, silent = true, callback = function ()
    require("dap").continue()
  end})
  -- 关闭调试
  pcall(vim.api.nvim_buf_del_keymap, 0, "n", "<C-s>s")
  vim.api.nvim_buf_set_keymap(0, "n", "<C-s>s", "", {noremap = true, silent = true, callback = function ()
    require("dap").terminate()
  end})
  -- 编译代码
  pcall(vim.api.nvim_buf_del_keymap, 0, "n", "<leader><C-b>")
  vim.api.nvim_buf_set_keymap(0, "n", "<leader><C-b>", "", {noremap = true, silent = true, callback = function ()
    local outFile = vim.fn.expand("%:p:r")
    local file = vim.fn.expand("%:p")
    local stdin = uv.new_pipe()
    local stdout = uv.new_pipe()
    local stderr = uv.new_pipe()
    local errorMessage = ""

    print("开始编译")

    local handle, pid = uv.spawn("g++", {
      stdio = {
        stdin,
        stdout,
        stderr,
      },
      args = {
        file,
        "-o",
        outFile,
        "-g"
      },
    }, function(code, signal)
      if code ~= 0 then
        error("编译错误" .. errorMessage)
      else
        print("编译完成")
      end
    end)

    -- print(handle, pid)

    uv.read_start(stderr, function(err, data)
      if data then
        errorMessage = errorMessage .. '\n' .. data
      else
      end
    end)
  end})
  -- 内置终端运行
  pcall(vim.api.nvim_buf_del_keymap, 0, "n", "<leader>b")
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>b", ":w <CR> :cd %:h <CR> :bel 10sp term://" ..
  "g++ % -g -o %< -fsanitize=undefined,address && " ..
  "echo build done &&" ..
  "./%< < input.txt" ..
  "<CR>"
  , {noremap = true, silent = true})
  -- 玩具
  pcall(vim.api.nvim_buf_del_keymap, 0, "n", "<leader>n")
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>n", "", {noremap = true, silent = true, callback = function()
    if (test == nil) then
      test = require("toggleterm.terminal").Terminal:new({
        cmd = "runner " .. vim.fn.expand("%:p") .. " -fsanitize=undefined,address",
        dir = vim.fn.expand("%:p:h"),
        direction = "float",
        start_in_insert = false,
        float_opts = {
          relative = "editor",
          border = "rounded",
          title = "hello world",
          title_pos = "center",
          row = 400,
          col = 400,
        },
        close_on_exit = false,
        on_exit = function(term, job, number, name)
          local list = {
            [0] = {"Accepted", "#00ff00"},
            [1] = {"Compilation Error", "#ffff00"},
            [2] = {"Wrong Answer", "#ff0000"},
            [3] = {"Runtime Error", "#a020f0"},
          }
          if (list[number] ~= nil) then
            vim.api.nvim_win_set_config(term.window, { title = list[number][1], title_pos = "center" })
          else
            vim.api.nvim_win_set_config(term.window, { title = "UKE", title_pos = "center" })
          end
          if (list[number] ~= nil) then
            vim.api.nvim_set_hl(0, "FloatTitle", { fg=list[number][2] })
          end
        end,
        on_open = function(term)
          -- 获取全局UI属性
          local ui = vim.api.nvim_list_uis()
          local height = math.floor(ui[1].height * 0.4)
          local width = math.floor(ui[1].width * 0.4)
          vim.api.nvim_win_set_config(term.window, {
            title = "Running...",
            title_pos = "center",
            height = height,
            width = width,
          })
          -- 设置窗口的大小
        end
      });
    end
    test:toggle()
  end})
end)

-- 设置 telescope 的快捷键
-- local builtin = require('telescope.builtin')
-- local set_keymap = vim.api.set_keymap
vim.api.nvim_set_keymap("n", "<leader>ff", "", {noremap = true, silent = true, callback = function()
  require("telescope.builtin").find_files()
end})
vim.api.nvim_set_keymap("n", "<leader>fg", "", {noremap = true, silent = true, callback = function()
  require("telescope.builtin").live_grep()
end})
vim.api.nvim_set_keymap("n", "<leader>fb", "", {noremap = true, silent = true, callback = function()
  require("telescope.builtin").buffers()
end})
vim.api.nvim_set_keymap("n", "<leader>fh", "", {noremap = true, silent = true, callback = function()
  require("telescope.builtin").help_tags()
end})
-- vim.keymap.set('n', '<leader>ff', require('telescope.builtin').builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', require('telescope.builtin').builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', require('telescope.builtin').builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', require('telescope.builtin').builtin.help_tags, {})
vim.o.splitright = true
vim.o.splitbelow = true

-- 设置gA gI go等常用快捷键（编写markdown时会用）
vim.api.nvim_set_keymap("n", "gA", "g$a", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gI", "g^i", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "go", "gA<CR>", {noremap = false, silent = true})

vim.api.nvim_set_keymap("n", "j", "gj", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "k", "gk", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "o", "go", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "I", "gI", {noremap = false, silent = true})
vim.api.nvim_set_keymap("n", "A", "gA", {noremap = false, silent = true})
