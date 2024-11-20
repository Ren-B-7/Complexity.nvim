return {
	{
		"Ren-B-7/csharp.nvim",
		enabled = false,
		lazy = true,
		ft = { "cs", "csx", "csproj", "sln" },
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			"Tastyep/structlog.nvim",
		},
		opts = {
			lsp = {
				omnisharp = {
					enable = true,
					-- The default timeout when communicating with omnisharp
					default_timeout = 10000000,
					-- Settings that'll be passed to the omnisharp server
					enable_editor_config_support = true,
					organize_imports = true,
					load_projects_on_demand = true,
					enable_analyzers_support = true,
					enable_import_completion = true,
					include_prerelease_sdks = true,
					analyze_open_documents_only = true,
					enable_package_auto_restore = true,
					-- Launches omnisharp in debug mode
					debug = false,
				},
				roslyn = {
					enable = false,
					cmd_path = nil,
				},
				-- Do this else cmp_nvim_lsp isnt lazily loaded
				capabilities = function()
					return require("cmp_nvim_lsp").default_capabilities()
				end,
				on_attach = function(client, bufnr)
					if client.server_capabilities["documentSymbolProvider"] then
						require("nvim-navic").attach(client, bufnr)
					end
				end,
			},
			logging = {
				level = "INFO",
			},
			dap = {
				adapter_name = nil,
			},
		},

		config = function()
			require("mason").setup()
		end,
	},
	{
		"MoaidHathot/dotnet.nvim",
		cmd = "DotnetUI",
		lazy = true,
		opts = {
			bootstrap = {
				auto_bootstrap = true, -- Automatically call "bootstrap" when creating a new file, adding a namespace and a class to the files
			},
			project_selection = {
				path_display = "filename_first", -- Determines how file paths are displayed. All of Telescope's path_display options are supported
			},
		},
		-- keys = { },
	},
}
