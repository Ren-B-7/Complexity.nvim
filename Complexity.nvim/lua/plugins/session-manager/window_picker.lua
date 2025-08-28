return {
	"s1n7ax/nvim-window-picker",
	name = "window-picker",
	lazy = true,
	config = true,

	opts = {
		hint = "floating-big-letter",
		selection_chars = "FJDKSLA;CMRUEIWOQP",
		picker_config = {
			handle_mouse_click = false,
			statusline_winbar_picker = {
				selection_display = function(char, windowid)
					return "%=" .. char .. "%="
				end,

				use_winbar = "never", -- "always" | "never" | "smart"
			},

			floating_big_letter = {
				font = "ansi-shadow", -- ansi-shadow |
			},
		},

		show_prompt = true,

		prompt_message = "Pick window: ",

		filter_func = nil,

		filter_rules = {
			autoselect_one = true,
			include_current_win = false,
			include_unfocusable_windows = false,
			bo = {
				filetype = { "NvimTree", "neo-tree", "notify", "snacks_notif" },
				buftype = { "terminal" },
			},
			wo = {},
			file_path_contains = {},
			file_name_contains = {},
		},
		highlights = {
			enabled = false,
			statusline = {
				focused = {
					fg = "#ededed",
					bg = "#e35e4f",
					bold = true,
				},
				unfocused = {
					fg = "#ededed",
					bg = "#44cc41",
					bold = true,
				},
			},
			winbar = {
				focused = {
					fg = "#ededed",
					bg = "#e35e4f",
					bold = true,
				},
				unfocused = {
					fg = "#ededed",
					bg = "#44cc41",
					bold = true,
				},
			},
		},
	},
	keys = {
		{
			"<leader>W", -- pick and jump
			function()
				local winid = require("window-picker").pick_window()
				if winid then
					vim.api.nvim_set_current_win(winid)
				end
			end,
			mode = "n",
			desc = "Pick and jump to a window",
		},
		{
			"<leader>Q", -- pick and close
			function()
				local winid = require("window-picker").pick_window()
				if winid then
					vim.api.nvim_win_close(winid, false)
				end
			end,
			mode = "n",
			desc = "Pick and close a window",
		},
	},
}
