return {
	{
		"mfussenegger/nvim-lint",
		dependencies = { "mason-org/mason.nvim", "rshkarin/mason-nvim-lint" },
		lazy = true,
		event = {
			"InsertLeave",
			"InsertEnter",
		},
		config = function()
			require("mason").setup()

			require("mason-nvim-lint").setup({
				ensure_installed = {
					"pylint",
					"shellcheck",
					"selene",
				},
				ignore_install = {},
				automatic_installation = false,
				quiet_mode = true,
				handlers = {},
			})

			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "pylint" },
				py = { "pylint" },
				lua = { "selene" },
				luau = { "selene" },
				bash = { "shellcheck" },
				sh = { "shellcheck" },
				zsh = { "shellcheck" },
				ksh = { "shellcheck" },
				csh = { "shellcheck" },
				make = { "mbake" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			lint.linters.mbake = {
				name = "mbake",
				cmd = "mbake",
				stdin = false,
				append_fname = true,
				stream = "stdout",
				ignore_exitcode = true,
				args = {
					"validate",
					"--config",
					function()
						local local_cfg = vim.fn.findfile(".bake.toml", ".;")
						return local_cfg ~= "" and local_cfg or vim.fn.expand("~/.config/.bake.toml")
					end,
				},
				parser = function(output, bufnr)
					local diagnostics = {}

					for _, line in ipairs(vim.split(output, "\n")) do
						local file, lnum, message = line:match("%s*([^:]+):(%d+):%s*(.+)")

						if file and lnum and message then
							message = message:gsub("^%*+%s*", ""):gsub("%s*Stop%.$", "")

							table.insert(diagnostics, {
								lnum = tonumber(lnum) - 1,
								col = 0,
								severity = vim.diagnostic.severity.ERROR,
								source = "mbake",
								message = vim.trim(message),
							})
						end
					end

					return diagnostics
				end,
			}
			vim.api.nvim_create_autocmd({
				"BufWritePost",
			}, {
				group = lint_augroup,
				callback = function()
					local ft = vim.bo.filetype
					if lint.linters_by_ft[ft] then
						lint.try_lint(nil, { ignore_errors = true })
					end
				end,
			})
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
	},
	{
		"rshkarin/mason-nvim-lint",
		lazy = true,
		enabled = true,
		dependencies = {
			"mason-org/mason.nvim",
		},
	},
}
