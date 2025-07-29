return {
	"lambdalisue/vim-suda",
	lazy = true,
	cmd = { "SudoRead", "SudoWrite" },
	config = function()
		vim.cmd("let g:suda_smart_edit = 1")
	end,
	opts = {},
}
