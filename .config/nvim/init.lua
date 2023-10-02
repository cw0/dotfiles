local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins_status_ok, plugins = pcall(require, "plugins")
if not plugins_status_ok then
  print("plugins.lua failed to load")
  return
end

local lazy_status_ok, lazy = pcall(require, "lazy")
if not lazy_status_ok then
  print("lazy package manager failed to load")
  return
end

lazy.setup(plugins, {})

require("settings")
require("autocommands")
