return {
	{
		"lewis6991/foldsigns.nvim",
		lazy = true,
		event = { "BufRead", "BufNewFile" },
		enabled = false,
		config = true,
		opts = { exclude = { "GitSigns.*" } },
	},
}
