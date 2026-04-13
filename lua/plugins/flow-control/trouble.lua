return {
	"folke/trouble.nvim",
	cmd = { "Trouble", "TodoTrouble" },
	lazy = true,
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<CR>",
			desc = "Diagnostics (Trouble)",
			mode = "n",
		},
		{
			"<leader>xf",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Buffer Diagnostics (Trouble)",
			mode = "n",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<CR>",
			desc = "Symbols (Trouble)",
			mode = "n",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<CR>",
			desc = "Location List (Trouble)",
			mode = "n",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<CR>",
			desc = "Quickfix List (Trouble)",
			mode = "n",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
			desc = "LSP Definitions / references / ... (Trouble)",
			mode = "n",
		},
	},
}
