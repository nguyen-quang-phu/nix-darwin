-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
require("config.lazy")

 -- put this after lazy setup
 dofile(vim.g.base46_cache .. "defaults")
 dofile(vim.g.base46_cache .. "statusline")
