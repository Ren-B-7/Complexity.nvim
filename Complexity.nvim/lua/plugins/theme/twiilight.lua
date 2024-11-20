return {
	"folke/twilight.nvim",
	enabled = false,
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = true,
	opts = {
		dimming = {
			alpha = 0.5,
			color = { "Normal", "#ffffff" },
			term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
			inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
		},
		context = 40,
		treesitter = true,
		expand = {
			"function",
			"method",
			"table",
			"if_statement",
			"for_loop",
			"while_loop",
			"case_statement",
			"try_except",
		},
		exclude = {}, -- exclude these filetypes
	},
}
