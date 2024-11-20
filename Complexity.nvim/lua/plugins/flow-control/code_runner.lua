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
		-- 		var_with_func = function()
		-- 			-- the value of this var is computed by running this function at runtime
		-- 			return "test-val"
		-- 		end,
		-- 	})
		-- end,
		keys = {
			{ "<localleader>fw", "<cmd>FlowLauncher<CR>", mode = { "n", "v" }, desc = "Show flow telescope" },
			{ "<localleader>fr", "<cmd>FlowRunfile<CR>", mode = { "n" }, desc = "Show flow telescope" },
			{ "<localleader>fr", "<cmd>FlowRunSelected<CR>", mode = { "v" }, desc = "Show flow telescope" },
			{ "<localleader>fl", "<cmd>FlowRunLastCmd<CR>", mode = { "n", "v" }, desc = "Show flow telescope" },
			{ "<localleader>fo", "<cmd>FlowLastOutput<CR>", mode = { "n", "v" }, desc = "Show flow telescope" },
		},
	},
}
