local out = {
	-- providers: provider used to get references in the buffer, ordered by priority
	providers = {
		"treesitter",
		"lsp",
		"regex",
	},
	delay = 100,
	filetype_overrides = {},
	filetypes_denylist = {
		"dirbuf",
		"dirvish",
		"fugitive",
	},
	filetypes_allowlist = {},
	modes_denylist = {},
	modes_allowlist = {},
	providers_regex_syntax_denylist = {},
	providers_regex_syntax_allowlist = {},
	under_cursor = true,
	large_file_cutoff = nil,
	large_file_overrides = nil,
	min_count_to_highlight = 1,
	should_enable = function(bufnr)
		return true
	end,
	case_insensitive_regex = false,
}

return {
	{
		"RRethy/vim-illuminate",
		enabled = true,
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("illuminate").configure(out)
		end,
	},
	{
		"mawkler/modicator.nvim",
		dependencies = {},
		enabled = true,
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			show_warnings = false,
			highlights = {
				defaults = {
					bold = true,
					italic = true,
				},
				use_cursorline_background = false,
			},
			integration = {
				lualine = {
					enabled = true,
					mode_section = nil,
					highlight = "bg",
				},
			},
		},
	},
}
