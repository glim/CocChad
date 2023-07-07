vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
vim.cmd [[set mouse=a]]

vim.g.mapleader = ','

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", "<leader>sh", ":Gitsigns stage_hunk<CR>", { noremap = true })

vim.keymap.set("n", "<leader>tO", ":OverseerToggle<CR>", { noremap = true })

vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
