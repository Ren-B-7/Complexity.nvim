return {
	{
		"lewis6991/foldsigns.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		enabled = true,
		config = true,
		opts = { exclude = { "GitSigns.*" } },
	},
}
