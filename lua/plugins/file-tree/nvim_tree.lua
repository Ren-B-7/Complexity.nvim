return {
	"A7Lavinraj/fyler.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	enabled = true,
	comfig = true,
	cmd = {
		"Fyler",
	},
	opts = {
		integrations = {
			icon = "nvim_web_devicons",
		},

		views = {
			finder = {
				default_explorer = true,
				git_status = {
					enabled = true,
				},
				indentscope = {
					enabled = true,
					group = "FylerIndentMarker",
					markers = " ",
				},
			},
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				require("fyler").toggle({
					dir = vim.fn.expand("%:h") ~= "" and vim.fn.expand("%:h")
						or vim.fs.normalize(vim.fn.fnamemodify(vim.uv.cwd(), ":h")),
					kind = "split_right_most",
				})
			end,
			desc = "Toggle tree view",
			mode = "n",
		},
		{
			"<localleader>eb",
			function()
				require("fyler").toggle({
					dir = vim.fn.expand("%:h") ~= "" and vim.fn.expand("%:h")
						or vim.fs.normalize(vim.fn.fnamemodify(vim.uv.cwd(), ":h")),
					kind = "split_below",
				})
			end,
			desc = "Toggle tree view",
			mode = "n",
		},
		{
			"<localleader>er",
			function()
				require("fyler").toggle({
					dir = vim.fn.expand("%:h") ~= "" and vim.fn.expand("%:h")
						or vim.fs.normalize(vim.fn.fnamemodify(vim.uv.cwd(), ":h")),
					kind = "split_right_most",
				})
			end,
			desc = "Toggle tree view right",
			mode = "n",
		},
		{
			"<leader>h",
			function()
				require("fyler").toggle({
					dir = vim.fs.normalize("~/"),
					kind = "split_right_most",
				})
			end,
			desc = "Toggle tree view, from home",
			mode = "n",
		},
		{
			"<localleader>ehl",
			function()
				require("fyler").toggle({
					dir = vim.fs.normalize("~/"),
					kind = "split_left_most",
				})
			end,
			desc = "Toggle tree view, from home",
			mode = "n",
		},
		{
			"<localleader>ehr",
			function()
				require("fyler").toggle({
					dir = vim.fs.normalize("~/"),
					kind = "split_right_most",
				})
			end,
			desc = "Toggle tree view",
			mode = "n",
		},
		{
			"<localleader>ehf",
			function()
				require("fyler").toggle({
					dir = vim.fs.normalize("~/"),
					kind = "split_float",
				})
			end,
			desc = "Toggle tree view",
			mode = "n",
		},
	},
}
