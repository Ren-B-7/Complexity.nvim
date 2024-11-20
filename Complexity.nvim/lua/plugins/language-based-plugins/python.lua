return {
	"jim-at-jibba/micropython.nvim",
	dependencies = { "akinsho/toggleterm.nvim", "stevearc/dressing.nvim" },
	enabled = false,
	lazy = true,
	ft = { "python" },
	config = true,
	opts = {
		ignore_list = {
			[".git"] = true,
			["requirements.txt"] = true,
			[".ampy"] = true,
			[".vscode"] = true,
			[".gitignore"] = true,
			["project.pymakr"] = true,
			["env"] = true,
			["venv"] = true,
			["__pycache__"] = true,
			[".python-version"] = true,
			[".micropy/"] = true,
			["micropy.json"] = true,
		},
	},
	-- require("lualine").setup({
	-- sections = {
	--     lualine_b = {
	--         {
	--           require("micropython_nvim").statusline,
	--           cond = package.loaded["micropython_nvim"] and require("micropython_nvim").exists,
	--         },
	--     }
	-- }
	-- })
}
