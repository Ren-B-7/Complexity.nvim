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
}
