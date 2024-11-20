return {
	{
		"echasnovski/mini.comment",
		version = "*",
		lazy = true,
		enabled = false,
		config = true,
		opts = {
			options = {
				custom_commentstring = nil,
				ignore_blank_line = true,
				start_of_line = false,
				pad_comment_parts = true,
			},
			mappings = {
				-- Normal and Visual modes
				comment = "gca",
				-- Toggle comment on current line
				comment_line = "gcc",
				-- Toggle comment on visual selection
				comment_visual = "gcc",
				-- Works also in Visual mode if mapping differs from `comment_visual`
				textobject = "gcs",
			},
			hooks = {
				pre = function() end,
				post = function() end,
			},
		},
	},
	{
		"echasnovski/mini.trailspace",
		version = "*",
		lazy = true,
		event = { "InsertEnter" },
		config = true,
		opts = { only_in_normal_buffers = true },
	},
}
