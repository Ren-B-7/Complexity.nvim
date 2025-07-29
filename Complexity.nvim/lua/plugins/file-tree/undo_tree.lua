return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	enabled = true,
	lazy = true,
	config = true,
	keys = { -- load the plugin only when using it's keybinding:
		{ "<leader>uu", "<cmd>lua require('undotree').toggle()<cr>" },
	},
}
