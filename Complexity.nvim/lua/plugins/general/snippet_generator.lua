return {
	"chrisgrieser/nvim-scissors",
	dependencies = "nvim-telescope/telescope.nvim",
	lazy = true,
	config = true,
	cmd = { "ScissorsAddNewSnippet", "ScissorsEditSnippet" },
	opts = {
		snippetDir = vim.fn.stdpath("config") .. "/snippets/",
		editSnippetPopup = {
			height = 0.4,

			width = 0.6,
			border = "rounded",
			keymaps = {
				cancel = "q",
				saveChanges = "<CR>",

				goBackToSearch = "<BS>",
				deleteSnippet = "<C-BS>",
				duplicateSnippet = "<C-d>",
				openInFile = "<C-o>",
				insertNextPlaceholder = "<C-p>",
			},
		},
		backdrop = {
			enabled = true,
			blend = 50,
		},
		telescope = {
			alsoSearchSnippetBody = true,
		},
	},
	keys = {
		{
			"<leader>snipp",
			function()
				require("scissors").addNewSnippet()
			end,
			mode = { "n", "x", "v" },
			desc = "Add new snippet",
		},
		{
			"<leader>snipe",
			function()
				require("scissors").editSnippet()
			end,
			mode = { "n", "x", "v" },
			desc = "Edit existing snippet",
		},
	},
}
