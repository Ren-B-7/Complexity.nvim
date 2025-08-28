return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = true,
	cmd = {
		"NvimTreeOpen",
		"NvimTreeToggle",
		"NvimTreeResize",
		"NvimTreeRefresh",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeFocus",
		"NvimTreeHiTest",
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"antosha417/nvim-lsp-file-operations",
	},
	config = true,
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			side = "left",
			width = 40,
			number = true,
			signcolumn = "no",
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
		},
	},
	keys = {
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<CR>",
			desc = "Toggle tree view",
			mode = "n",
		},
		{
			"<leader>nf",
			"<cmd>NvimTreeFindFile<CR>",
			desc = "Navigate to current file with tree",
			mode = "n",
		},
		{
			"<leader>h",
			"<cmd>NvimTreeFocus<CR>",
			desc = "Focus on NvimTree",
			mode = "n",
		},
	},
}
