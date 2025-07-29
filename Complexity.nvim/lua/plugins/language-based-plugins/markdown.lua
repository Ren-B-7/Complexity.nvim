return {
	"https://github.com/brianhuster/live-preview.nvim/",
	-- dir = "/home/renier/Documents/live_preview/live-preview.nvim/",
	-- "Ren-B-7/live-preview.nvim",
	lazy = true,
	enabled = true,
	ft = { "markdown" },
	config = true,
	opts = {
		port = 42069,
		-- browser = "flatpak run org.chromium.Chromium",
		dynamic_root = true,
		sync_scroll = true,
		picker = "",
	},
	cmd = { "LivePreview" }, -- lazy-load only when needed
	keys = {
		{ "<leader>ls", "<cmd>LivePreview start<cr>", desc = "Open current file in your browser" },
		{ "<leader>lc", "<cmd>LivePreview close<cr>", desc = "Close the live preview server" },
		{ "<leader>lp", "<cmd>LivePreview pick<cr>", desc = "Close the live preview server" },
	},
}
