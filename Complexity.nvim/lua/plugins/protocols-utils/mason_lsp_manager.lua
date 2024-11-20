local navic_attach = function(client, bufnr)
	if client.server_capabilities["documentSymbolProvider"] then
		require("nvim-navic").attach(client, bufnr)
	end
end

local basedpyright_opts = {
	on_attach = navic_attach,
	settings = {
		basedpyright = {
			analysis = { typeCheckingMode = "standard" },
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
			format = {
				enable = false,
			},
			diagnostics = {
				globals = { "vim", "spec" },
			},
			runtime = {
				version = "LuaJIT",
				special = {
					spec = "require",
				},
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
				arrayIndex = "Disable", -- "Enable" | "Auto" | "Disable"
				await = true,
				paramName = "Disable", -- "All" | "Literal" | "Disable"
				paramType = true,
				semicolon = "All", -- "All" | "SameLine" | "Disable"
				setType = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

return {
	{
		"williamboman/mason.nvim",
		enabled = true,
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUpdate",
			"MasonLog",
			"MasonUninstall",
			"MasonUninstallAll",
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"omnisharp",
					"basedpyright",
					"clangd",
					"jdtls",
					"quick-lint-js",
				},
				handlers = {
					function(server_name)
						-- ones that are handled else where
						require("lspconfig")[server_name].setup({
							on_attach = navic_attach,
						})
					end,
					-- This is not setup yet
					-- ["rust_analyzer"] = function()
					--     local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
					--     local codelldb_path = extension_path .. 'adapter/codelldb'
					--     local liblldb_path = extension_path .. 'lldb/lib/liblldb'
					--
					--     liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
					--
					--     vim.g.rustaceanvim = {
					--         -- Plugin configuration
					--         tools = {
					--         },
					--         -- LSP configuration
					--         server = {
					--             on_attach = navic_attach,
					--             default_settings = {
					--                 ['rust-analyzer'] = {
					--                 },
					--             },
					--         },
					--         -- DAP configuration
					--         dap = {
					--             adapter = require('rustaceanvim.config').get_codelldb_adapter(codelldb_path, liblldb_path),
					--         },
					--     }
					--     require("rustaceanvim").setup()
					-- end,
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup(lua_ls_opts)
					end,
					["omnisharp"] = function()
						require("csharp").setup()
					end,
					["basedpyright"] = function()
						require("lspconfig").basedpyright.setup(basedpyright_opts)
					end,
				},
			})

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
		dependencies = {
			{
				"zeioth/garbage-day.nvim",
				lazy = true,
				opts = {
					aggressive_mode = false,
					excluded_lsp_clients = {},
					grace_period = 90,
					wakeup_delay = 100,
				},
				keys = {
					{
						"<localleader>killa",
						"<cmd>lua require('garbage-day.utils').stop_lsp()<CR>",
						mode = "n",
						desc = "Kill all open lsps",
					},
					{
						"<localleader>killu",
						"<cmd>lua require('garbage-day.utils').start_lsp()<CR>",
						mode = "n",
						desc = "Unkill buffer-linked lsps",
					},
				},
			},
		},
		lazy = true,
	},
}
