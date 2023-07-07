local compat = require("custom.compat")

local M = { "akinsho/toggleterm.nvim" }

M.name = "toggleterm"
M.lazy = false
M.cond = not compat
-- M.dependencies = {}

M.init = function()
end

M.config = function()
  require("toggleterm").setup({
    open_mapping = [[<c-\>]],
  })

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

-- M.branch = ""

-- M.event = { "InsertEnter" }
-- M.cmd = { "Copilot" }
-- M.ft = {}
-- M.keys = {}

-- M.priority = 0

return M
