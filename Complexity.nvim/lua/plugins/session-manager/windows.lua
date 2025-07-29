return {
	"anuvyklack/windows.nvim",
	dependencies = {
		"anuvyklack/middleclass",
	},
	lazy = true,
	enabled = true,
	cmd = {
		"WindowsToggleAutowidth",
		"WindowsDisableAutowidth",
		"WindowsEnableAutowidth",
		"WindowsMaximizeVertically",
		"WindowsMaximizeHorizontally",
		"WindowsEqualize",
		"WindowsMaximize",
	},
	opts = {
		autowidth = {
			enable = true,
			winwidth = 10,
			filetype = {
				help = 2,
			},
		},
		ignore = {
			buftype = { "quickfix" },
			filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
		},
	},
	keys = {
		{ "<localleader><Left>", "<Cmd>leftabove vsplit<CR>", desc = "Split left", mode = "n" },
		{ "<localleader><Right>", "<Cmd>rightbelow vsplit<CR>", desc = "Split right", mode = "n" },
		{ "<localleader><Up>", "<Cmd>aboveleft split<CR>", desc = "Split up", mode = "n" },
		{ "<localleader><Down>", "<Cmd>belowright split<CR>", desc = "Split down", mode = "n" },
	},
}
