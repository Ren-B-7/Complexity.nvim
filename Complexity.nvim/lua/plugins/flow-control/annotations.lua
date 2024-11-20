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
			"<localleader>nd",
			"<cmd>Neogen<cr>",
			-- function()
			-- body
			-- end
			mode = { "n", "v" },
			desc = "Generate annotations for current context",
		},
	},
}
