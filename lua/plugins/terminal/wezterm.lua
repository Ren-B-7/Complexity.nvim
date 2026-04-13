return {
	"willothy/wezterm.nvim",
	name = "wezterm",
	lazy = true,
	enabled = vim.fn.executable("wezterm"),
	event = { "UIEnter" },
	opts = {},
}
