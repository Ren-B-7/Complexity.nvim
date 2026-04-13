return {
	"folke/zen-mode.nvim",
	lazy = true,
	cmd = { "ZenMode" },
	opts = {
		window = {
			backdrop = 0.5, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			width = 0.95,
			height = 1, -- height of the Zen window
			options = {},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = false, -- disables the command in the last line of the screen
				laststatus = 0, -- turn off the statusline in zen mode
			},
			twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
			gitsigns = { enabled = false }, -- disables git signs
			tmux = { enabled = false }, -- disables the tmux statusline
			todo = { enabled = true }, -- if set to "true", todo-comments.nvim highlights will be disabled
			wezterm = {
				enabled = true,
				font = "+3",
			},
		},
	},
	keys = { { "<localleader><localleader>", "<cmd>ZenMode<cr>", mode = { "n" }, desc = "Toggles ZenMode" } },
}
