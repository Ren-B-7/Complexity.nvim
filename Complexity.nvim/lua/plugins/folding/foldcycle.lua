local open = function()
	return require("fold-cycle").open()
end
local close = function()
	return require("fold-cycle").close()
end
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
	keys = {
		{
			"<localleader>co",
			open,
			desc = "Fold-cycle: open folds",
			mode = "n",
		},
		{
			"<leader><Right>",
			open,
			desc = "Fold-cycle: open folds",
			mode = "n",
		},
		{
			"<localleader>cc",
			close,
			desc = "Fold-cycle: close folds",
			mode = "n",
		},
		{
			"<leader><Left>",
			close,
			desc = "Fold-cycle: close folds",
			mode = "n",
		},
		{
			"<localleader>cO",
			function()
				return require("fold-cycle").open_all()
			end,
			desc = "Fold-cycle: open all folds",
			mode = "n",
			remap = true,
			silent = true,
		},
		{
			"<localleader>cC",
			function()
				return require("fold-cycle").close_all()
			end,
			desc = "Fold-cycle: close all folds",
			mode = "n",
			remap = true,
			silent = true,
		},
	},
}
