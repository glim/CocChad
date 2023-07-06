local compat = require("custom.compat")

local M = { "zbirenbaum/copilot.lua" }

M.name = "copilot"
M.lazy = true
M.cond = not compat
-- M.dependencies = {}

M.init = function()
end

M.config = function()
  require("copilot").setup({
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<tab>",
      }
    }

  })
end

-- M.branch = ""

M.event = { "InsertEnter" }
M.cmd = { "Copilot" }
-- M.ft = {}
-- M.keys = {}

-- M.priority = 0

return M
