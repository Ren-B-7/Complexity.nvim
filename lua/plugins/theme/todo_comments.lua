return {
	"folke/todo-comments.nvim",
	enabled = true,
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
	cmd = { "TodoTrouble" },
	opts = {
		signs = true,
		sign_priority = 8,

		keywords = {
			FIX = {
				icon = " ",
				color = "error",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			},
			TODO = { icon = " ", color = "info", alt = { "REMEMBER" } },
			HACK = { icon = " ", color = "warning", alt = { "THE FUCK" } },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
		gui_style = {
			fg = "NONE",
			bg = "BOLD",
		},
		merge_keywords = true,
		highlight = {
			multiline = true,
			multiline_pattern = "^.",
			multiline_context = 10,
			before = "",
			keyword = "wide",
			after = "fg",
			pattern = {
				[[.*<(KEYWORDS):]],
				[[.*<(KEYWORDS),]],
				[[.*<(KEYWORDS)!]],
			},
			comments_only = true,
			max_line_len = 400,
			exclude = {},
		},

		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
			test = { "Identifier", "#FF00FF" },
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			pattern = [[\b(KEYWORDS)(:|,|!)]],
		},
	},
	keys = {
		{
			"<leader>xt",
			"<cmd>TodoTrouble<cr>",
			mode = { "n" },
			desc = "TODO List (Trouble)",
		},
	},
}
