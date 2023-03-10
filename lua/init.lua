


vim.opt.termguicolors = true


-- disable netrw at the very start of your init.lua (strongly advised)
--vim.g.loaded = 1
--vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
--packer.startup(function()
  --local use = use
    --use 'wbthomason/packer.nvim'
  --end
--)


