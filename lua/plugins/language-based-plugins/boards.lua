return {
	"anurag3301/nvim-platformio.lua",
	dependencies = { "akinsho/toggleterm.nvim", "stevearc/dressing.nvim" },
	enabled = false,
	lazy = true,
	event = { "Pioinit", "Piorun", "Piocmd", "Piolib", "Piomon", "Piodebug", "Piodb" },
	config = true,
	opts = {},
}
