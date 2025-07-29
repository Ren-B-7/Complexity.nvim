return {
	{
		"MaximilianLloyd/tw-values.nvim",
		enabled = false,
		lazy = true,
		config = true,
		cmd = { "TWValues" },
		event = {},
		opts = {},
		keys = {
			{ "<leader>sv", "<cmd>TWValues<cr>", desc = "Show tailwind CSS values" },
		},
	},
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = true,
		ft = { "tailwind", "css", "html" },
		enabled = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		opts = {
			ui = {
				border = "rounded",
				notification_style = "plugin",
			},
			decorations = {
				statusline = {
					app_version = false,
					device = false,
					project_config = false,
				},
			},
			debugger = {

				enabled = true,
				exception_breakpoints = {},
				evaluate_to_string_in_debug_views = true,
				register_configurations = function(paths)
					require("dap").configurations.dart = {}
				end,
			},

			root_patterns = { ".git", "pubspec.yaml" },

			fvm = false,

			widget_guides = {
				enabled = false,
			},
			closing_tags = {
				highlight = "ErrorMsg",

				prefix = ">",

				priority = 10,

				enabled = true,
			},
			dev_log = {
				enabled = true,
				filter = nil,

				notify_errors = false,

				open_cmd = "tabedit",
			},
			dev_tools = {
				autostart = true,

				auto_open_browser = false,
			},
			outline = {
				open_cmd = "30vnew",

				auto_open = false,
			},
			lsp = {
				color = {

					enabled = true,

					background = false,

					background_color = nil,

					foreground = false,

					virtual_text = true,

					virtual_text_str = "■",
				},
				on_attach = nil,
				capabilities = nil,

				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
					renameFilesWithClasses = "prompt",

					enableSnippets = true,
					updateImportsOnRename = true,
				},
			},
		},
	},

	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		lazy = true,
		enabled = false,
		ft = { "css", "html" },
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
			require("cmp").config.formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			}
		end,
		opts = {
			keymaps = {
				rename = nil,

				repeat_rename = ".",
			},
			hurl = {

				show_headers = false,

				floating = false,

				json5 = false,

				formatters = {

					json = { "prettierd" },
					html = { "prettierd" },
				},
			},
		},
	},
	{
		"rest-nvim/rest.nvim",
		lazy = true,
		ft = { "http" },
		enabled = false,
		config = function()
			vim.g.rest_nvim = {
				custom_dynamic_variables = {},
				request = {
					skip_ssl_verification = false,
					hooks = {
						encode_url = true,
						user_agent = "rest.nvim v" .. require("rest-nvim.api").VERSION,
						set_content_type = true,
					},
				},
				response = {
					hooks = {
						decode_url = true,
						format = true,
					},
				},
				clients = {
					curl = {
						statistics = {
							{ id = "time_total", winbar = "take", title = "Time taken" },
							{ id = "size_download", winbar = "size", title = "Download size" },
						},
						opts = {
							set_compressed = false,
						},
					},
				},
				cookies = {
					enable = true,
					path = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "rest-nvim.cookies"),
				},
				env = {
					---@type boolean
					enable = true,
					---@type string
					pattern = ".*%.env.*",
				},
				ui = {
					winbar = true,
					keybinds = {
						prev = "H",
						next = "L",
					},
				},
				highlight = {
					enable = true,
					timeout = 750,
				},
				_log_level = vim.log.levels.WARN,
			}
		end,
	},
}
