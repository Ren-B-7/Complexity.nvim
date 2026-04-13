return {
	{
		"sainnhe/sonokai",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			-- Set options here if not defined globally
			vim.g.sonokai_style = "mala"
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_enable_italic = 1
			vim.cmd.colorscheme("sonokai")
		end,
	},
	{
		"askfiy/visual_studio_code",
		lazy = false,
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme visual_studio_code]])
			require("visual_studio_code").setup({
				-- `dark` or `light`
				mode = "light",
				-- Whether to load all color schemes
				preset = true,
				-- Whether to enable background transparency
				transparent = false,
				-- Whether to apply the adapted plugin
				expands = {
					hop = false,
					dbui = true,
					lazy = true,
					aerial = true,
					null_ls = true,
					nvim_cmp = true,
					gitsigns = true,
					which_key = true,
					nvim_tree = true,
					lspconfig = true,
					telescope = true,
					bufferline = true,
					nvim_navic = true,
					nvim_notify = true,
					vim_illuminate = true,
					nvim_treesitter = true,
					nvim_ts_rainbow = false,
					nvim_scrollview = true,
					nvim_ts_rainbow2 = true,
					indent_blankline = true,
					vim_visual_multi = true,
				},
				hooks = {
					before = function(conf, colors, utils) end,
					after = function(conf, colors, utils) end,
				},
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		enabled = false,
		opts = {
			variant = "dawn", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = true,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},

			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},

			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",

				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",

				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",

				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},

			palette = {},

			highlight_groups = {
				Comment = { fg = "foam" },
				VertSplit = { fg = "muted", bg = "muted" },
			},

			before_highlight = function(group, highlight, palette)
				if highlight.fg == palette.pine then
					highlight.fg = palette.foam
				end
			end,
		},
		config = function()
			vim.cmd("colorscheme rose-pine-dawn")
		end,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = true,
		opts = { -- Main options --
			style = "warm", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = false, -- Show/hide background
			term_colors = true, -- Change terminal color as per the selected theme style
			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
			toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
			toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
			code_style = {
				comments = "italic",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},

			-- Lualine options --
			lualine = {
				transparent = true, -- lualine center bar transparency
			},
			colors = {}, -- Override default colors
			highlights = {}, -- Override highlight groups
			diagnostics = {
				darker = true, -- darker colors for diagnostic
				undercurl = true, -- use undercurl instead of underline for diagnostics
				background = true, -- use background color for virtual text
			},
		},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme solarized-osaka]])
		end,
		opts = {
			{
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
				on_colors = function(colors) end,
				on_highlights = function(highlights, colors) end,
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		opts = {},
		config = function()
			vim.cmd([[colorscheme tokyonight-day]])
			-- -- Lua
			-- require("barbecue").setup({
			-- 	-- ... your barbecue config
			-- 	theme = "tokyonight",
			-- 	-- ... your barbecue config
			-- })
			-- -- Lua
			-- require("lualine").setup({
			-- 	options = {
			-- 		-- ... your lualine config
			-- 		theme = "tokyonight",
			-- 		-- ... your lualine config
			-- 	},
			-- })
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
		opts = {
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "wave", -- Load "wave" theme when 'background' option is not set
			background = { -- map the value of 'background' option to a theme
				dark = "wave", -- try "dragon" !
				light = "lotus",
			},
		},
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		enabled = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				-- ...
			})
			vim.cmd("colorscheme github_dark_high_contrast")
		end,
	},
}
