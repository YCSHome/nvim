-- 一些常用的工具

local M = {}

-- 加载config
M.load_config = function(config)
  for key, val in pairs(config) do
    for key2, val2 in pairs(val) do
      vim[key][key2] = val2
    end
  end
end

-- 用来判断val是否在table里面
M.inTable = function(table, val)
  for _, value in pairs(table) do
    if (value == val) then
      return true
    end
  end
  return false
end

-- 负责包装函数
M.bind = function(fn, ...)
  local tmp = ...
  return function()
    return fn(tmp)
  end
end

-- 获取配置文件的名字
M.get_config_name = function(value)
  local config_name = string.reverse(value)
  config_name = string.gsub(string.reverse(string.sub(config_name, 1, string.find(config_name, "/") - 1)), "[.]", "-")
  return config_name
end

-- 初始化 pack list
M.init_pack = function(able)
  local plug = {}
  for name, config in pairs(able) do
    config[1] = name
    table.insert(plug, config)
  end
  return plug
end

return M
