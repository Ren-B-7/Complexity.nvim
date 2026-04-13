return {
	{
		"rcarriga/nvim-notify",
		lazy = true,
		event = { "UIEnter" },
		config = true,
		opts = {},
	},
	{
		"mrded/nvim-lsp-notify",
		dependencies = { "rcarriga/nvim-notify" },
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lsp-notify").setup({
				notify = require("notify"),
			})
		end,
	},
}
