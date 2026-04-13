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
		{ "<C-w>", "<cmd>WindowsMaximize<CR>", desc = "Maximize window" },
		{ "<C-a>", "<cmd>WindowsMaximizeVertically<CR>", desc = "Maximize window vertically" },
		{ "<C-d>", "<cmd>WindowsMaximizeHorizontally<CR>", desc = "Maximize window horizontally" },
		{ "<C-s>", "<cmd>WindowsEqualize<CR>", desc = "Equalize window sizes" },
	},
}
