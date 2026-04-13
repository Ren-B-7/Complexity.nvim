return {
	"stevearc/conform.nvim",
	enabled = true,
	dependencies = {
		{ "zapling/mason-conform.nvim", dependencies = { "mason-org/mason.nvim" }, enabled = true },
	},
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mason-conform").setup({
			ensure_installed = {
				"beautysh",
				"prettier",
				"clang-format",
				"stylua",
				"black",
				"mbake",
			},
		})

		require("conform").setup({
			formatters_by_ft = {
				ksh = { "beautysh" },
				csh = { "beautysh" },
				zsh = { "beautysh" },
				sh = { "beautysh" },
				python = { "black" },
				py = { "black" },
				c = { "clang-format" },
				csharp = { "clang-format" },
				cs = { "clang-format" },
				cpp = { "clang-format" },
				json = { "clang-format", "prettier" },
				java = { "clang-format" },
				javascript = { "clang-format", "prettier" },
				angular = { "prettier" },
				css = { "prettier" },
				flow = { "prettier" },
				graphql = { "prettier" },
				html = { "prettier" },
				jsx = { "prettier" },
				less = { "prettier" },
				markdown = { "prettier" },
				scss = { "prettier" },
				typescript = { "prettier" },
				vue = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
				luau = { "stylua" },
				make = { "mbake" },
			},
			format_on_save = function()
				if not vim.g.autoformat then
					return
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				}
			end,
			formatters = {
				["clang-format"] = {
					prepend_args = function()
						local format_root = require("utils.functions").find_format_file("clang")
						local out = format_root and { "--style=file:" .. format_root } or {}
						return out
					end,
				},
				["mbake"] = {
					command = "mbake",
					args = {
						"format",
						"$FILENAME",
					},
					stdin = false,
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
