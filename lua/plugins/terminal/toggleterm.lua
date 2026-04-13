return {
	"akinsho/toggleterm.nvim",
	lazy = true,
	config = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermToggleAll",
		"TermExec",
		"TermSelect",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualLines",
		"ToggleTermSendVisualSelection",
		"ToggleTermSetName",
	},
	opts = { shade_terminals = true, shading_factor = 2, shading_ration = 10 },
	keys = {
		{
			"<leader>tv",
			"<cmd>ToggleTerm direction=vertical<CR>",
			desc = "Create new vertical terminal",
			mode = { "n", "t", "v" },
		},
		{
			"<leader>th",
			"<cmd>ToggleTerm direction=horizontal<CR>",
			desc = "Create new horizontal terminal",
			mode = { "n", "t", "v" },
		},
		{
			"<leader>tf",
			"<cmd>ToggleTerm direction=float<CR>",
			desc = "Create new hover terminal",
			mode = { "n", "t", "v" },
		},
	},
}
