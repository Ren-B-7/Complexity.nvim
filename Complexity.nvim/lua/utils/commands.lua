local cmd = vim.cmd
local m = {}

local toggle_auto_format = function()
	cmd(":command TF :lua require('utils.functions').toggle_format_on_save(0)")
end

local lightmode = function()
	cmd(":command Light :lua vim.cmd('Catppuccin latte'); require('notify')('light-mode')")
end

local mediummode = function()
	cmd(":command Medium :lua vim.cmd('Catppuccin frappe'); require('notify')('medium-mode')")
end

local custommode = function()
	cmd(":command Custom :lua vim.cmd('Catppuccin mocha'); require('notify')('custom-mode')")
end

local darkmode = function()
	cmd(":command Dark :lua vim.cmd('Catppuccin macchiato'); require('notify')('dark-mode')")
end

m.start = function()
	toggle_auto_format()
	lightmode()
	mediummode()
	darkmode()
	custommode()
end

return m
