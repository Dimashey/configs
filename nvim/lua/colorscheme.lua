local colorscheme = "catppuccin-macchiato" --catppuccin, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
local notify = require "notify"

if not status_ok then
  notify("colorscheme" .. colorscheme .. "not found!")
  return
end
