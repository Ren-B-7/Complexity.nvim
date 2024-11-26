return {
	"hedyhli/outline.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	enabled = true,
	lazy = true,
	cmd = {
		"Outline",
		"OutlineOpen",
		"OutlineClose",
		"OutlineFocus",
		"OutlineFocusOutline",
		"OutlineFocusCode",
		"OutlineStatus",
		"OutlineFollow",
		"OutlineRefresh",
	},
	config = true,
	opts = {},
	keys = {
		{ "<localleader>oo", "<cmd>Outline<CR>", desc = "Toggle outline" },
		{ "<localleader>of", "<cmd>OutlineFocus<CR>", desc = "Focus on outline" },
		{ "<localleader>or", "<cmd>OutlineRefresh<CR>", desc = "Refresh outline" },
		{ "<localleader>oF", "<cmd>OutlineFollow<CR>", desc = "Follow current outline" },
		{ "<localleader>os", "<cmd>OutlineStatus<CR>", desc = "Give outline status" },
	},
}
