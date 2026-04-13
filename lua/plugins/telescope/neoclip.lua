return {
	"AckslD/nvim-neoclip.lua",
	lazy = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
	},
	opts = {
		history = 25,
		enable_persistent_history = false,
		length_limit = 1048576,
		continuous_sync = false,
		filter = nil,
		preview = true,
		prompt = nil,
		default_register = '"',
		default_register_macros = "q",
		enable_macro_history = true,
		content_spec_column = false,
		disable_keycodes_parsing = false,
		on_select = {
			move_to_front = true,
			close_telescope = true,
		},
		on_paste = {
			set_reg = false,
			move_to_front = true,
			close_telescope = true,
		},
		on_replay = {
			set_reg = false,
			move_to_front = true,
			close_telescope = true,
		},
		on_custom_action = {
			close_telescope = true,
		},
		keys = {
			telescope = {
				i = {
					select = "<cr>",
					paste = "<c-p>",
					paste_behind = "<c-P>",
					replay = "<c-r>", -- replay a macro
					delete = "<c-d>", -- delete an entry
					edit = "<c-e>", -- edit an entry
					custom = {},
				},
				n = {
					select = { "<cr>" },
					paste = { "p", "<c-p>" },
					paste_behind = { "P", "<c-P>" },
					replay = "<c-r>", -- replay a macro
					delete = { "d", "<c-d>" }, -- delete an entry
					edit = { "e", "<c-e>" }, -- edit an entry
					custom = {},
				},
			},
		},
	},
	config = true,
}
