return {
	"saghen/blink.cmp",
	lazy = true,
	event = { "BufAdd", "BufEnter" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					lazy = true,
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
	},
	version = "*",
	opts = {
		completion = {
			ghost_text = { enabled = true, show_with_menu = true },
			menu = { auto_show = true },
			list = { selection = { preselect = true, auto_insert = true } },
		},
		-- Key mappings preselect
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			["<C-Up>"] = { "select_prev", "fallback" },
			["<C-Down>"] = { "select_next", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<Up>"] = false,
			["<Down>"] = false,
			["<Left>"] = false,
			["<Right>"] = false,
		},

		appearance = {
			-- Use nvim-cmp highlight groups if the theme doesn't support blink.cmp
			use_nvim_cmp_as_default = true,
			-- Adjust spacing for Nerd Fonts
			nerd_font_variant = "mono",
		},
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				lsp = {
					name = "lsp",
					enabled = true,
					module = "blink.cmp.sources.lsp",
					score_offset = 90, -- Higher number = higher priority
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
					score_offset = 25,
					fallbacks = { "snippets", "buffer" },
					opts = {
						trailing_slash = false,
						label_trailing_slash = true,
						get_cwd = function(context)
							return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
						end,
						show_hidden_files_by_default = true,
					},
				},
				buffer = {
					name = "Buffer",
					enabled = true,
					max_items = 3,
					module = "blink.cmp.sources.buffer",
					min_keyword_length = 4,
					score_offset = 15,
				},
				snippets = {
					name = "snippets",
					enabled = true,
					min_keyword_length = 2,
					module = "blink.cmp.sources.snippets",
					score_offset = 85,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
