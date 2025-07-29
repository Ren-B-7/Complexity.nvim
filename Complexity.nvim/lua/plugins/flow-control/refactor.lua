return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
	},
	enabled = true,
	lazy = true,
	cmd = {},
	opts = {
		prompt_func_return_type = {
			go = false,
			java = false,

			cpp = false,
			c = false,
			h = false,
			hpp = false,
			cxx = false,
		},
		prompt_func_param_type = {
			go = false,
			java = false,

			cpp = false,
			c = false,
			h = false,
			hpp = false,
			cxx = false,
		},
		printf_statements = {},
		print_var_statements = {},
		show_success_message = false, -- shows a message with information about the refactor on success
		-- i.e. [Refactor] Inlined 3 variable occurrences
	},
	keys = {
		{
			"<leader>re",
			function()
				return require("refactoring").refactor("Extract Function")
			end,
			mode = { "n", "x" },
			expr = true,
			desc = "Refactor: Extract Function",
		},
		{
			"<leader>rf",
			function()
				return require("refactoring").refactor("Extract Function To File")
			end,
			mode = { "n", "x" },
			expr = true,
			desc = "Refactor: Extract Function to File",
		},
		{
			"<leader>rv",
			function()
				return require("refactoring").refactor("Extract Variable")
			end,
			mode = { "n", "x" },
			expr = true,
			desc = "Refactor: Extract Variable",
		},
		{
			"<leader>rI",
			function()
				return require("refactoring").refactor("Inline Function")
			end,
			mode = { "n", "x" },
			expr = true,
			desc = "Refactor: Inline Function",
		},
		{
			"<leader>ri",
			function()
				return require("refactoring").refactor("Inline Variable")
			end,
			mode = { "n", "x" },
			expr = true,
			desc = "Refactor: Inline Variable",
		},
		{
			"<leader>rbb",
			function()
				return require("refactoring").refactor("Extract Block")
			end,
			mode = { "n", "x" },
			expr = true,
			desc = "Refactor: Extract Block",
		},
		{
			"<leader>rbf",
			function()
				return require("refactoring").refactor("Extract Block To File")
			end,
			mode = { "n", "x" },
			expr = true,
			desc = "Refactor: Extract Block to File",
		},
	},
}
