return {
	"jghauser/fold-cycle.nvim",
	lazy = true,
	enabled = true,
	dependencies = {
		"kevinhwang91/nvim-ufo",
		lazy = true,
	},
	opts = {
		open_if_max_closed = true, -- closing a fully closed fold will open it
		close_if_max_opened = true, -- opening a fully open fold will close it
		softwrap_movement_fix = false, -- see below
	},
	config = true,
}
