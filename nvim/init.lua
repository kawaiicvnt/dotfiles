vim.loader.enable()

local utils = require("utils")

local expected_version = "0.11.4"
utils.is_compatible_version(expected_version)

local config_dir = vim.fn.stdpath("config")
---@cast config_dir string

-- We use nvim-tree, thus need to disable netrw early to win a race condition
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--vim.g.NvimTreeRequired = 1

vim.cmd("tab all")

-- some global settings
require("globals")
-- setting options in nvim
vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml_conf/options.vim"))
-- all the plugins installed and their configurations
vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml_conf/plugins.vim"))
--vim.cmd("source " .. vim.fs.joinpath(config_dir, "macros.vim"))
require("macros")
require("lsp")
vim.cmd[[colorscheme catppuccin-macchiato]]

vim.api.nvim_create_autocmd({ 'User' }, {
    pattern = 'VeryLazy',
    command = ':NvimTreeOpen'
})
