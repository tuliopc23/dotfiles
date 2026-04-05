-- NvChad base46 compiles highlights here (see https://nvchad.com/docs/config/walkthrough)
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
