return {
	"folke/which-key.nvim",
	lazy = true,
	event = { "UIEnter" },
	opts = { plugins = { marks = false } },
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
