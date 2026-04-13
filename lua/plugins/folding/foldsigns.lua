return {
	{
		"lewis6991/foldsigns.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		enabled = false,
		config = true,
		opts = { exclude = { "GitSigns.*" } },
	},
}
