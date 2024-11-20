return {
	"mistricky/codesnap.nvim",
	build = "make",
	enabled = true,
	lazy = true,
	cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapSaveHighlight", "CodeSnapHighlight", "CodeSnapAscii" },
	config = true,
	opts = { watermark = "Ren B7", save_path = "~/Pictures" },
	keys = {
		{
			"<localleader>cc",
			"<cmd>CodeSnap<cr>",
			mode = { "v", "x" },
			desc = "Save selected code snapshot into clipboard",
		},
		{
			"<localleader>cs",
			"<cmd>CodeSnapSave<cr>",
			mode = { "x", "v" },
			desc = "Save selected code snapshot in ~/Pictures",
		},
	},
}
