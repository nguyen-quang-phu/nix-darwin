-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.g.lazygit_config = false

vim.opt.showtabline = 0
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.swapfile = false
vim.opt.eof = true
vim.opt.eol = true
vim.opt.wrap = true

vim.filetype.add({
  extension = {
    yml = 'yaml'
  }
})
vim.g.lazyvim_ruby_lsp = "solargraph"
vim.g.lazyvim_ruby_formatter = "rubocop"
