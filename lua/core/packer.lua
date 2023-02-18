-- 用来优化 packer 的使用

local M = { }

M.bootstrap = function()
  local fn = vim.fn
  local packer_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(packer_path)) > 0 then
    print "Cloning packer .."
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path }
    print("restart and enter PackerSync")
    return false
  end
  return true
end

M.options = {
  auto_clean = true,
  compile_on_sync = true,
  git = {
    clone_timeout = 6000,
  },
  display = {
    working_sym = '⟳', -- The symbol for a plugin being installed/updated
    error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
    done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '-', -- The symbol for an unused plugin which was removed
    moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = '━', -- The symbol for the header line in packer's display
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- M.run = function(plugins)
--   local ok, packer = pcall(require, "packer")
--   if not ok then
--     return
--   end
-- 
--   local temp = require("core.utils").merge_plugins(plugins)
-- 
--   packer.init(M.options)
-- 
--   packer.startup(function(use)
--     for _, value in pairs(temp) do
--       use(value)
--     end
--   end)
-- end

M.load_pack = function(name)
end

M.run = function(config, list)
  local ok, packer = pcall(require, "packer")
  if (not ok) then
    error("you haven't install packer")
    return
  end
  if (config == nil) then
    error("you don't provide config")
    return
  end
  if (list == nil) then
    error("you dont't provide packages list")
    return
  end

  packer.init(M.options)

  packer.startup(function(use)
    for _, value in pairs(list) do
      local ok, plug = pcall(require, config .. "." .. core.utils.get_config_name(value))
      if (not ok) then
        -- error("you didn't have the config " .. config .. "/" .. value)
        plug = {
          opt = true
        }
      end
      plug[1] = value

      use(plug)
    end
  end)
end

return M

