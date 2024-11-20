return {
	"stevearc/conform.nvim",
	enabled = true,
	dependencies = {
		{ "zapling/mason-conform.nvim", dependencies = { "williamboman/mason.nvim" }, enabled = true },
	},
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local format_root = vim.fs.find(function(name, path)
			return name:match(".*%.clang-format$")
		end, { limit = 1, type = "file", path = vim.fn.stdpath("config") })

		require("mason-conform").setup({
			ensure_installed = {
				"beautysh",
				"prettierd",
				"black",
				"clang-format",
				"stylua",
			},
		})

		require("conform").setup({
			formatters_by_ft = {
				bash = { "beautysh" },
				sh = { "beautysh" },
				ksh = { "beautysh" },
				csh = { "beautysh" },
				zsh = { "beautysh" },
				python = { "black" },
				py = { "black" },
				c = { "clang-format" },
				csharp = { "clang-format" },
				cs = { "clang-format" },
				cpp = { "clang-format" },
				json = { "clang-format", "prettierd" },
				java = { "clang-format" },
				javascript = { "clang-format", "prettierd" },
				angular = { "prettierd" },
				css = { "prettierd" },
				flow = { "prettierd" },
				graphql = { "prettierd" },
				html = { "prettierd" },
				jsx = { "prettierd" },
				less = { "prettierd" },
				markdown = { "prettierd" },
				scss = { "prettierd" },
				typescript = { "prettierd" },
				vue = { "prettierd" },
				yaml = { "prettierd" },
				lua = { "stylua" },
				luau = { "stylua" },
			},
			format_on_save = function()
				if not vim.g.autoformat then
					return
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				}
			end,
			formatters = {
				clang_format = {
					prepend_args = function()
						local out = format_root and { "--style-file:" .. format_root } or {}
						table.insert(out, "--fallback-style=webkit")
						return out
					end,
				},
			},
		})
	end,
	keys = {
		{
			"<leader>mf",
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or range (in visual mode)",
		},
	},
}
