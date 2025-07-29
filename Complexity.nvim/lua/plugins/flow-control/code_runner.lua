return {
	{
		"swaits/scratch.nvim",
		enabled = true,
		build = nil,
		lazy = true,
		cmd = { "Scratch", "ScratchSplit" },
		event = {},
		config = true,
		opts = {},
		keys = {
			{ "<localleader>sc", "<cmd>Scratch<cr>", desc = "Scratch Buffer", mode = "n" },
			{ "<localleader>ss", "<cmd>ScratchSplit<cr>", desc = "Scratch Buffer (split)", mode = "n" },
		},
	},
	{
		"arjunmahishi/flow.nvim",
		lazy = true,
		cmd = { "FlowRunSelected", "FlowRunFile", "FlowLauncher", "FlowRunLastCmd", "FlowLastOutput" },
		opts = {},
		-- config = function()
		-- 	-- optional custom variables
		-- 	require("flow.vars").add_vars({
		-- 		str = "test-val-2",
		-- 		num = 3,
		-- 		bool = true,
		-- 			-- the value of this var is computed by running this function at runtime
		-- 			return "test-val"
		-- 		end,
		-- 	})
		-- end,
		keys = {
			{ "<localleader>flf", "<cmd>FlowRunFile<CR>", mode = { "n" }, desc = "Run file through flow" },
			{ "<localleader>flr", "<cmd>FlowRunSelected<CR>", mode = { "v" }, desc = "Run selected code via flow" },
			{ "<localleader>flc", "<cmd>FlowRunLastCmd<CR>", mode = { "n", "v" }, desc = "Rerun  last flow command" },
			{ "<localleader>flo", "<cmd>FlowLastOutput<CR>", mode = { "n", "v" }, desc = "Show the previous output" },
		},
	},
}
