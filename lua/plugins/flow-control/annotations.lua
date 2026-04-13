return {
	"danymat/neogen",
	config = true,
	lazy = true,
	cmd = "Neogen",
	opts = {
		snippet_engine = "luasnip",
		languages = {},
	},
	keys = {
		{
			"<localleader>an",
			-- "<cmd>Neogen<cr>",
			function()
				require("neogen").generate()
			end,
			mode = { "n", "v" },
			desc = "Generate annotations for current context",
		},
		{
			"<localleader>af",
			-- "<cmd>Neogen<cr>",
			function()
				require("neogen").generate({ type = "func" })
			end,
			mode = { "n", "v" },
			desc = "Generate annotations for current func",
		},
		{
			"<localleader>ac",
			-- "<cmd>Neogen<cr>",
			function()
				require("neogen").generate({ type = "class" })
			end,
			mode = { "n", "v" },
			desc = "Generate annotations for current class",
		},
	},
}
