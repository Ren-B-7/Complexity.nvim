return {
	"folke/todo-comments.nvim",
	enabled = true,
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = true,
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "TodoTrouble", "TodoTelescope" },
	opts = {
		signs = true, -- show icons in the signs column
		sign_priority = 8, -- sign priority
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			},
			TODO = { icon = " ", color = "info", alt = { "REMEMBER" } },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
		gui_style = {
			fg = "NONE", -- The gui style to use for the fg highlight group.
			bg = "BOLD", -- The gui style to use for the bg highlight group.
		},
		merge_keywords = true, -- when true, custom keywords will be merged with the defaults
		highlight = {
			multiline = true, -- enable multine todo comments
			multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
			multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			keyword = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
			after = "fg", -- "fg" or "bg" or empty
			pattern = {
				[[.*<(KEYWORDS):]],
				[[.*<(KEYWORDS)-]],
				[[.*<(KEYWORDS),]],
				[[.*<(KEYWORDS)\\]],
				[[.*<(KEYWORDS)/]],
				[[.*<(KEYWORDS)!]],
			},
			comments_only = true, -- uses treesitter to match keywords in comments only
			max_line_len = 400, -- ignore lines longer than this
			exclude = {}, -- list of file types to exclude highlighting
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
			pattern = {
				[[\b(KEYWORDS):]],
				[[\b(KEYWORDS)-]],
				[[\b(KEYWORDS),]],
				[[\b(KEYWORDS)/]],
				[[\b(KEYWORDS)\\]],
				[[\b(KEYWORDS)!]],
			}, -- match without the extra colon. You'll likely get false positives
		},
	},
}
-- TODO:
-- REMEMBER:
-- INFO:
-- HACK:
-- WARN,
-- XXX!
-- TEST-
-- PASSED:
-- PERFORMANCE,
-- PERF,
-- OPTIMIZE/
-- OPTIM:
-- FAILED\
-- FIX\
-- BUG/
-- FIXME!
-- ISSUE,
