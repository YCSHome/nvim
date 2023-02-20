-- 一些基本的配置
-- 注册mode

local utils = core.utils
local hook = core.mode.hook
local bind = utils.bind

require("config.mode_list")

-- 设置lsp相关的sign

local sign = { Error = '', Hint = 'ﴞ', Info = '', Warn = '', }
for name_, text_ in pairs(sign) do
  local set_sign = vim.fn.sign_define
  local temp = "DiagnosticSign" .. name_
  set_sign(temp, {text = text_, texthl = temp, numhl = 'DiagnosticDefault' .. name_})
end

local diagnostic = {
  virtual_text = {
    prefix = "",
  },
  float = true
}

vim.diagnostic.config(diagnostic)

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
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>b", ":w <CR> :cd %:h <CR> :bel 10sp term://" ..
  "g++ % -fsanitize=address -o %< && " ..
  "echo build done &&" ..
  "./%<" ..
  "<CR>"
  , {noremap = true, silent = true})
end)

hook(cpp_buf_mode, function()
  vim.api.nvim_buf_set_keymap(0, "n", "<leader>n", "", {noremap = true, silent = true, callback = function()
    if (test == nil) then
      test = require("toggleterm.terminal").Terminal:new({
        cmd = "runner " .. vim.fn.expand("%") .. " -fsanitize=address",
        direction = "float",
        start_in_insert = false,
        dir = vim.fn.expand("%:h"),
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
