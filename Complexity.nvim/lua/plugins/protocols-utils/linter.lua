return {
	"mfussenegger/nvim-lint",
	dependencies = { { "rshkarin/mason-nvim-lint", dependencies = { "williamboman/mason.nvim" } } },
	lazy = true,
	event = {
		"InsertLeave",
		"InsertEnter",
	},
	config = function()
		require("mason").setup()

		require("mason-nvim-lint").setup({
			ensure_installed = {
				"semgrep",
				"bacon",
				"cpplint",
				"quick-lint-js",
				"pylint",
				"shellcheck",
				"selene",
				"sonarlint-language-server",
			},
			automatic_installation = false,
			quiet_mode = false,
		})

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({
			"BufEnter",
			"BufWritePost",
			"InsertLeave",
		}, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint(nil, { ignore_errors = true })
			end,
		})

		return {
			linters_by_ft = {
				rust = { "bacon" },
				rs = { "bacon" },
				c = { "cpplint", "semgrep" },
				cpp = { "cpplint" },
				python = { "pylint", "semgrep" },
				py = { "pylint", "semgrep" },
				javascript = { "quick-lint-js", "semgrep" },
				typescript = { "quick-lint-js", "semgrep" },
				javascriptreact = { "quick-lint-js" },
				typescriptreact = { "quick-lint-js" },
				lua = { "selene" },
				luau = { "selene" },
				bash = { "shellcheck" },
				sh = { "shellcheck" },
				zsh = { "shellcheck" },
				ksh = { "shellcheck" },
				csh = { "shellcheck" },
				cs = { "sonarlint-language-server", "semgrep" },
				csharp = { "sonarlint-language-server", "semgrep" },
				terraform = { "sonarlint-language-server" },
				go = { "sonarlint-language-server", "semgrep" },
				xml = { "sonarlint-language-server" },
				json = { "semgrep" },
				java = { "semgrep" },
				php = { "semgrep" },
				ruby = { "semgrep" },
				scala = { "semgrep" },
			},
		}
	end,
	keys = {
		{
			"<leader>ml",
			function()
				require("lint").try_lint()
			end,
			mode = "n",
			desc = "Trigger linting for file",
		},
	},
}
