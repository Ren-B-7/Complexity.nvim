return {
	"axieax/urlview.nvim",
	lazy = true,
	enabled = true,
	cmd = "UrlView",
	config = true,
	opts = {
		default_title = "links",
		default_register = "+",
		unique = true,
		sorted = true,
		default_action = "system",
		default_prefix = "https://",
	},
	keys = {
		{
			"<localleader>fuu",
			"<cmd>UrlView buffer<cr>",
			mode = { "n" },
			desc = "View all urls in current buffer",
		},
		{
			"<localleader>fup",
			"<cmd>UrlView Lazy<cr>",
			mode = { "n" },
			desc = "View urls of all installed plugins",
		},
	},
}
