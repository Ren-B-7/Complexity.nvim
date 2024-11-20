return {
	"axieax/urlview.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	lazy = true,
	enabled = true,
	cmd = "UrlView",
	config = true,
	opts = {
		default_title = "links",
		default_picker = "telescope",
		default_register = "+",
		unique = true,
		sorted = true,
		default_action = "system",
		default_prefix = "https://",
	},
}
