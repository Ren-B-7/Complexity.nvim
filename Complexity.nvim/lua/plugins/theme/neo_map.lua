return {
	"Isrothy/neominimap.nvim",
	lazy = true,
	enabled = true,
	event = { "BufReadPost", "BufRead" },
	init = function()
		vim.g.neominimap = {
			auto_enable = true,
			exclude_buftypes = {
				"quickfix",
				"terminal",
				"prompt",
				"Mason",
				"Conform",
				"Lazy",
				"man",
				"help",
				"git",
				"git_diffs",
				"nowrite",
			},
			exclude_filetypes = { "commit", "gitcommit", "git_commit", "help", "man", "markdown", "undotree" },
			layout = "float",
			float = {
				minimap_width = 20,
				max_minimap_height = nil,

				margin = {
					right = 0,
					top = 0,
					bottom = 0,
				},
				z_index = 1,

				window_border = "single",
			},
			delay = 200,

			sync_cursor = true,

			click = {
				enabled = false,
				auto_switch_focus = true,
			},
			diagnostic = {
				enabled = true,
				severity = vim.diagnostic.severity.WARN,
				mode = "line",
				priority = {
					ERROR = 100,
					WARN = 90,
					INFO = 80,
					HINT = 70,
				},
				icon = {
					ERROR = "✘",
					WARN = "▲",
					INFO = "⚑",
					HINT = "»",
				},
			},

			git = {
				enabled = true,
				mode = "sign",
				priority = 6,
				icon = {
					add = "+ ",
					change = "~",
					delete = "- ",
				},
			},
			treesitter = {
				enabled = true, ---@type boolean
				priority = 200, ---@type integer
			},
			fold = {
				enabled = true, ---@type boolean
			},
		}
	end,
}
