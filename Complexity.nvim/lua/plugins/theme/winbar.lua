return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		theme = "catppuccin-mocha",
		create_autocmd = false,
		attach_navic = false,
		show_dirname = false,
		show_basename = false,
		show_navic = true,
		exclude_filetypes = {
			"Mason",
			"Lazy",
			"Nvim_tree",
			"Telescope",
			"Git",
			"Neogit",
			"netrw",
			"terminal",
			"wezterminal",
			"toggleterm",
		},
	},
	config = function()
		vim.api.nvim_create_autocmd({
			"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
	keys = {
		{
			"<leader><BS>",
			function()
				require("barbecue.ui").navigate(-1)
			end,
			desc = "Navigate backwards by keyword",
			mode = "n",
		},
	},
}
