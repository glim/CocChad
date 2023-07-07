local compat = require("custom.compat")

local M = { "stevearc/overseer.nvim" }

M.name = "overseer"
M.lazy = false
M.cond = not compat
-- M.dependencies = {}

M.init = function()
end

M.config = function()
  require("overseer").setup({
    -- open_mapping = [[<c-\>]],
    strategy = "toggleterm",
  })
end

-- M.branch = ""

-- M.event = { "InsertEnter" }
-- M.cmd = { "Copilot" }
-- M.ft = {}
-- M.keys = {}

-- M.priority = 0

return M
