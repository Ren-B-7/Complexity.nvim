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
}
