return {
	"mistricky/codesnap.nvim",
	build = "make",
	enabled = true,
	lazy = true,
	cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapSaveHighlight", "CodeSnapHighlight", "CodeSnapAscii" },
	config = true,
	opts = {
		watermark = "Ren-B-7",
		save_path = "~/Pictures/",
		has_breadcrumbs = true,
		has_line_number = true,
		bg_theme = "summer",
	},
	keys = {
		{
			"<localleader>cc",
			function()
				local codesnap = require("codesnap")
				codesnap.copy_into_clipboard()
			end,
			mode = { "v", "x" },
			desc = "Save selected code snapshot into clipboard",
		},
		{
			"<localleader>cs",
			function()
				local codesnap = require("codesnap")
				codesnap.save_snapshot()
			end,
			mode = { "v", "x" },
			desc = "Save selected code snapshot in ~/Pictures/",
		},
	},
}
