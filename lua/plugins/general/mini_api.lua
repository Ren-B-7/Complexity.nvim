return {
	{
		"echasnovski/mini.trailspace",
		version = "*",
		lazy = true,
		event = { "InsertEnter" },
		config = true,
		opts = { only_in_normal_buffers = true },
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		enabled = true,
		lazy = true,
		config = true,
		event = { "InsertEnter" },
	},
}
