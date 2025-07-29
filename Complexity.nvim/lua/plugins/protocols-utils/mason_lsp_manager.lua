-- LSP integration

local navic_attach = function(client, bufnr)
	if client.server_capabilities["documentSymbolProvider"] then
		require("nvim-navic").attach(client, bufnr)
	end
end

local basedpyright_opts = {
	on_attach = function(client, bufnr)
		if client.server_capabilities["documentSymbolProvider"] then
			require("nvim-navic").attach(client, bufnr)
		end
		if client.server_capabilities["semanticTokensProvider"] then
			client.server_capabilities["semanticTokensProvider"] = nil
		end
	end,
	settings = {
		basedpyright = {
			-- Regular pyright options
			organizeimports = true,
			reportMissingImports = true,
			reportDuplicateImport = true,
			reportUnusedImport = true,
			reportUnusedClass = true,
			reportUnusedFunction = true,
			reportAssertTypeFailure = true,
			reportIndexIssue = true,
			reportOptionalCall = false,
			reportRedaclaration = true,
			reportTypedDictNotRequiredAccess = true,
			reportReturnType = false,
			reportConstantRedefinition = true,
			reportIncompatibleMethodOverride = true,
			reportDeprecated = true,
			reportMissingSuperCall = true,
			reportUninitializedInstanceVariable = true,
			reportAssertAlwaysTrue = true,
			reportUnhashable = true,
			reportUnusedCallResult = true,
			reportUnusedCoroutine = true,
			reportMatchNotExhaustive = true,
			reportShadowedImports = true,
			reportImplicitStringConcatenation = true,

			-- Based pyright
			reportUnusedParameter = true,
			reportPrivateLocalImportUsage = true,
			failOnWarnings = true,
			reportInvalidCast = true,
			reportImplicitAbstractClass = true,
			reportAny = true,
			reportUnknownParameterType = false,
			reportMissingParameterType = false,
			reportUnsafeMultipleInheritance = true,
			analysis = {
				typeCheckingMode = "basic",
				diagnosticMode = "openFilesOnly",
				autoImportCompletions = true,
			},
		},
	},
}

local lua_ls_opts = {
	on_attach = navic_attach,
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
				return nil
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = true,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {
			format = { enable = false },
			diagnostics = { globals = { "vim", "spec" } },
			runtime = {
				version = "LuaJIT",
				special = { spec = "require" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			hint = {
				enable = true,
				arrayIndex = "Disable",
				await = true,
				paramName = "Disable",
				paramType = true,
				semicolon = "All",
				setType = false,
			},
			telemetry = { enable = false },
		},
	},
}

local custom_configs = {
	basedpyright = basedpyright_opts,
	lua_ls = lua_ls_opts,
	-- add more server custom configs here if needed
}

return {
	{
		"mason-org/mason.nvim",
		lazy = true,
		cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonLog" },
		event = { "UIEnter" },
		config = function()
			require("mason").setup()

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "»",
					},
				},
				virtual_text = true,
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
			"blink.cmp",
		},
		lazy = true,
		event = { "BufAdd" },
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				automatic_installation = true,
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"omnisharp",
					"basedpyright",
					"clangd",
					"jdtls",
					"quick_lint_js",
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
				local opts = {
					capabilities = capabilities,
				}

				if custom_configs[server_name] then
					opts = vim.tbl_deep_extend("force", opts, custom_configs[server_name])
				end

				require("lspconfig")[server_name].setup(opts)
			end

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "»",
					},
				},
				virtual_text = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
	},
	{
		"zeioth/garbage-day.nvim",
		lazy = true,
		event = { "BufNew", "BufAdd" },
		opts = {
			aggressive_mode = false,
			excluded_lsp_clients = {},
			grace_period = 600,
			wakeup_delay = 100,
		},
		keys = {
			{
				"<localleader>killa",
				function()
					require("garbage-day.utils").stop_lsp()
				end,
				mode = "n",
				desc = "Kill all open lsps",
			},
			{
				"<localleader>killu",
				function()
					require("garbage-day.utils").start_lsp()
				end,
				mode = "n",
				desc = "Unkill buffer-linked lsps",
			},
		},
	},
}
