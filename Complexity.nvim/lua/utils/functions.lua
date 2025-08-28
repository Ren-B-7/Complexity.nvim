local api = vim.api
local cmd = vim.cmd
local logs = vim.log

local set_opts = api.nvim_set_option_value
local get_opts = api.nvim_get_option_value

local utils = {}

utils.DEBUG = logs.levels.debug
utils.INFO = logs.levels.info
utils.TRACE = logs.levels.trace
utils.WARN = logs.levels.warn
utils.ERROR = logs.levels.error
utils.OFF = 0

utils.notify = function(message, log)
	log = log or utils.INFO
	if log ~= utils.OFF then
		local status, notify = pcall(require, "notify")
		return status and notify(message, log) or vim.notify(message, log)
	end
end

utils.toggle_list_and_col = function(log)
	log = log or utils.INFO
	utils.notify("Toggle column and list", log)
	utils.toggle_list(utils.OFF)
	utils.toggle_colorcol(utils.OFF)
end

utils.toggle_colorcol = function(log)
	log = log or utils.INFO
	utils.notify("Toggle colorcolumn", log)

	local val = (get_opts("colorcolumn", {}) == "" and tostring(get_opts("textwidth", {})) or "")
	set_opts("colorcolumn", val, {})
end

utils.toggle_list = function(log)
	log = log or utils.INFO
	utils.notify("Toggle list", log)
	cmd("set list!")
end

utils.toggle_modifiable = function(log)
	log = log or utils.INFO

	vim.bo.modifiable = not vim.bo.modifiable
	utils.notify("Set modifiable " .. (vim.bo.modifiable and "true" or "false"), log)
end

utils.reload_nvim_tree = function(log)
	log = log or utils.INFO
	utils.notify("Reload Nvim Tree", log)

	require("nvim-tree.api").tree.open()
	require("nvim-tree.api").tree.reload()
	require("nvim-tree.api").tree.focus()
end

utils.toggle_format_on_save = function(log)
	log = log or utils.INFO

	vim.g.autoformat = not vim.g.autoformat
	utils.notify("Set format on save " .. (vim.g.autoformat and "true" or "false"), log)
end

utils.create_and_name_file = function(log)
	log = log or utils.INFO

	local callback = function(input)
		if input and input ~= "" then
			local filepath = vim.fs.normalize(vim.fn.fnameescape(vim.uv.cwd() .. "/" .. input)) -- absolute path
			local dir = vim.fn.fnamemodify(filepath, ":h") -- directory path

			if vim.fn.isdirectory(dir) == 0 then
				vim.fn.mkdir(dir, "p") -- create parent dirs if needed
			end

			vim.cmd("edit " .. vim.fn.fnameescape(filepath))
			vim.cmd("startinsert")
			utils.notify("New file made: " .. filepath, log)
		else
			print("No filename provided")
		end
	end
	local info = {
		prompt = "Create new file",
		default = "",
		completion = "file",
	}
	vim.ui.input(info, callback)
end

utils.find_format_file = function(lsp_name)
	local files = vim.fs.find(function(name, path)
		return name:match(lsp_name .. ".*$")
	end, { limit = 1, type = "file", path = vim.fn.stdpath("config") })
	return files and files[1] or {}
end

return utils
