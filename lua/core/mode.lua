-- 一些与mode相关的东西

local M = {}

M.list = {}

M.fn = {}

-- 注册一个mode
M.register_mode = function(name, event, opts, checker)
  -- 如果已经被注册了
  if (M.list[name] ~= nil)  then
    error(name .. " had been registered")
  end

  -- 注册
  M.list[name] = {}

  opts.callback = function()
    if (checker == nil or checker()) then
      -- 若check通过了，那么就执行mode内所有加入的函数
      for key, val in pairs(M.list[name]) do
        val()
      end
    end
  end
  vim.api.nvim_create_autocmd(event, opts)
  return name
end

-- 往mode里加入函数
M.hook = function(mode, fn)
  -- 判断是否有这个mode
  if (M.list[mode] == nil) then
    error("the mode hadn't been registered")
  end

  table.insert(M.list[mode], fn)

end

return M
