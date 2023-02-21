-- 注册一些常用的mode

local rmode = core.mode.register_mode
local utils = core.utils

normal_mode = rmode("normal-mode", {"BufEnter", "BufWinEnter"}, {}, nil)

linux_mode = rmode("linux-mode", {"BufEnter", "BufWinEnter"}, {}, utils.bind(vim.fn.has, "linux"))

code_mode = rmode("code-mode", {"BufEnter", "BufWinEnter"}, {}, function()
  if (utils.inTable({"lua", "python", "cpp", "c"}, vim.bo.filetype)) then
    return true
  end
  return false
end)

code_buf_mode = rmode("code-buf-mode", {"BufEnter"}, {}, function()
  if (utils.inTable({"lua", "python", "cpp", "c"}, vim.bo.filetype)) then
    return true
  end
  return false
end)

cpp_mode = rmode("cpp-mode", {"BufEnter", "BufWinEnter"}, {pattern = {"*.cpp", "*.hpp"}}, nil)
cpp_buf_mode = rmode("cpp-buf-mode", {"BufEnter"}, {pattern = {"*.cpp", "*.hpp"}}, nil)

help_mode = rmode("help-mode", {"BufEnter", "BufWinEnter"}, {}, function()
  if (vim.bo.filetype == "help") then
    return true
  end
  return false
end)

help_buf_mode = rmode("help-buf-mode", {"BufEnter"}, {}, function()
  if (vim.bo.filetype == "help") then
    return true
  end
  return false
end)

-- 每次进入markdown缓冲区都会加载
markdown_mode = rmode("markdown-mode", {"BufEnter", "BufWinEnter"}, {pattern = {"*.md"}}, nil)
-- 只有在第一次载入缓冲区时才会加载
markdown_buf_mode = rmode("markdown-buf-mode", {"BufEnter"}, {pattern = {"*.md"}}, nil)
