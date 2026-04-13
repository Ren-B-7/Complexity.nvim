return {
	"ahmedkhalf/project.nvim",
	lazy = true,
	config = function()
		require("telescope").load_extension("projects")
	end,
	opts = {
		manual_mode = false,
		detection_methods = { "lsp", "pattern" },
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "=src", ".sln" },

		ignore_lsp = {},

		exclude_dirs = {},
		show_hidden = true,
		silent_chdir = true,
		scope_chdir = "global",
		datapath = vim.fn.stdpath("data"),
	},
	keys = {
		{
			"<leader>pf",
			function()
				require("telescope").extensions.projects.projects({})
			end,
			mode = { "n" },
			desc = "Open project picker",
		},
	},
}
