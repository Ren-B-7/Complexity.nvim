return {
	"folke/ts-comments.nvim",
	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	enabled = vim.fn.has("nvim-0.10.0") == 1,
	opts = { c = "/* %s */" },
}
