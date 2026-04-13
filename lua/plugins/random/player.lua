return {
	"Ren-B-7/player.nvim",
	dependencies = { "rcarriga/nvim-notify" },
	enabled = true,
	lazy = true,
	cmd = { "Player" },
	config = true,
	opts = { notifier = 1 },
	keys = {
		{
			"<C-p>",
			"<cmd>Player play-pause<cr>",
			mode = { "n" },
			desc = "Toggle music play pause",
		},
		{
			"<C-]>",
			"<cmd>Player next<cr>",
			mode = { "n" },
			desc = "Skip to next song",
		},
		{
			"<C-[>",
			"<cmd>Player previous<cr>",
			mode = { "n" },
			desc = "Return to previous song",
		},
	},
}