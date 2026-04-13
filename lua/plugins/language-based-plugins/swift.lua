return {
	"m-housh/swift.nvim",
	lazy = true,
	enabled = false,
	filetype = { "swift", "swft", "apple" },
	dependencies = { "akinsho/toggleterm.nvim" },
	config = function()
		require("swift").setup()
		local actions = require("swift.actions")

		-- Setup keymaps for build and test commands to your likings.
		vim.keymap.set("n", "<c-b>", actions.build, { desc = "Build swift application" })
		vim.keymap.set("n", "<c-u>", actions.test, { desc = "Test swift application" })
	end,
	opts = { setup_formatting = true },
}
