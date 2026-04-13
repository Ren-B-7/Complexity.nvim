return {
	"lambdalisue/vim-suda",
	lazy = true,
	cmd = { "SudaRead", "SudaWrite" },
	config = function()
		vim.cmd("let g:suda_smart_edit = 1")
	end,
	opts = {},
}
