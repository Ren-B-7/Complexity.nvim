return {
	{
		"romus204/tree-sitter-manager.nvim",
		lazy = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("tree-sitter-manager").setup({
				ensure_installed = {
					"c",
					"cpp",
					"lua",
					"python",
					"query",
					"rust",
					"javascript",
					"typescript",
					"bash",
					"json",
					"xml",
					"html",
					"yaml",
					"vim",
					"markdown",
					"markdown_inline",
				},
				auto_install = false,
				highlight = true,
				nohighlight = {},
			})
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = { "romus204/tree-sitter-manager.nvim" },
		enabled = true,
		lazy = true,
		opts = {},
		config = function()
			require("rainbow-delimiters.setup").setup({})
		end,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
	{
		"romus204/tree-sitter-manager.nvim-textobjects",
		dependencies = { "romus204/tree-sitter-manager.nvim" },
		enabled = false,
		lazy = true,
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
}
