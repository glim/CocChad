local compat = require("custom.compat")

local M = { "rmagatti/auto-session" }

M.name = "auto-session"
M.lazy = false
M.cond = not compat
-- M.dependencies = {"stevearc/overseer.nvim"}

M.init = function()
end

M.config = function()
  -- Convert the cwd to a simple file name
  local function get_cwd_as_name()
    local dir = vim.fn.getcwd(0)
    return dir:gsub("[^A-Za-z0-9]", "_")
  end

  local overseer = require("overseer")

  require("auto-session").setup({
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Documents", "~/code", "~/Downloads", "/" },
    pre_save_cmds = {
      function()
        overseer.save_task_bundle(
          get_cwd_as_name(),
          -- Passing nil will use config.opts.save_task_opts. You can call list_tasks() explicitly and
          -- pass in the results if you want to save specific tasks.
          nil,
          { on_conflict = "overwrite" } -- Overwrite existing bundle, if any
        )
      end,
    },
    -- Optionally get rid of all previous tasks when restoring a session
    pre_restore_cmds = {
      function()
        for _, task in ipairs(overseer.list_tasks({})) do
          task:dispose(true)
        end
      end
    },
    post_restore_cmds = {
      function()
        overseer.load_task_bundle(get_cwd_as_name(), { ignore_missing = true })
      end,
    },
  })
end

-- M.branch = ""

-- M.event = { "InsertEnter" }
-- M.cmd = { "Copilot" }
-- M.ft = {}
-- M.keys = {}

-- M.priority = 0

return M
