local statusok, alpha, theme, dashboard

local recent_align = "center"
local recent_files = {
	type = "group",
	val = {
		{
			type = "text",
			val = "Recent files",
			opts = {
				hl = "Comment",
			},
		},
		{
			type = "group",
			val = function()
				local temp = theme.mru(0, vim.fn.getcwd(), 10, theme.mru_opts)
				temp.opts = {
					shrink_margin = false,
					position = recent_align,
					inherit = { shrink_margin = false, position = recent_align },
				}
				return { temp }
			end,
		},
	},
	opts = {
		shrink_margin = false,
		position = recent_align,
		inherit = { shrink_margin = false, position = recent_align },
	},
}

local create = function()
	statusok, alpha = pcall(require, "alpha")
	if not statusok then
		return
	end
	theme = require("alpha.themes.theta") or {}
	dashboard = require("alpha.themes.dashboard") or {}
	local themeconfig = theme.config
	local plugs = require("lazy").stats()

	themeconfig.layout[1] = { type = "padding", val = 2 }
	themeconfig.layout[2] = {
		type = "text",
		val = {
			" .d8888b.   .d8888b.  888b     d888 8888888b.  888      8888888888 Y88b       d88P d8b 888    Y88b   d88P ",
			"d88P  Y88b d88P  Y88b 8888b   d8888 888   Y88b 888      888         Y88b     d88P  Y8P 888     Y88b d88P  ",
			"888    888 888    888 88888b d88888 888    888 888      888          Y88b   d88P       888      Y88o88P   ",
			"888        888    888 888Y88 88P888 888   d88P 888      8888888       Y88b d88P    888 888888    Y888P    ",
			'888        888    888 888 Y8 8P 888 8888888P"  888      888           d88P Y88b    888 888        888     ',
			"888    888 888    888 888  Y P  888 888        888      888          d88P   Y88b   888 888        888     ",
			"Y88b  d88P Y88b  d88P 888       888 888        888      888         d88P     Y88b  888 Y88b.      888     ",
			' "Y8888P"   "Y8888P"  888       888 888        88888888 8888888888 d88P       Y88b 888  "Y888     888     ',
		},
		opts = { position = "center", hl = "Keyword" },
	}
	themeconfig.layout[3] = { type = "padding", val = 1 } --padding

	themeconfig.layout[4] = recent_files -- recent files

	themeconfig.layout[5] = { type = "padding", val = 1 } --padding

	themeconfig.layout[6] = {
		type = "group",
		val = {
			dashboard.button("e", "  > New file", require("utils.functions").create_and_name_file),
			dashboard.button("f", "󰍉  > Find file", "<cmd>lua Snacks.picker.files()<CR>"),
			dashboard.button("r", "  > Recent", "<cmd>lua Snacks.picker.recent()<CR>"),
			dashboard.button(
				"c",
				"  > Config",
				"<cmd>lua Snacks.picker.files({cwd = vim.fn.stdpath('config')})<CR>"
			),
			dashboard.button("g", "  > Grep", "<cmd>lua Snacks.picker.grep()<CR>"),
			dashboard.button("s", "󰒅  > Sessions", "<cmd>SessionSearch<CR>"),
			dashboard.button("p", "󰚥  > Plugin manager", "<cmd>Lazy<CR>"),
			dashboard.button("b", "  > Bookmarks", "<cmd>lua require('harpoon.ui').toggle_quick_menu() <CR>"),
			dashboard.button("m", "  > Mason", "<cmd>Mason<CR>"),
			dashboard.button("q", "󰈆  > Quit NVIM", "<cmd>q!<CR>"),
		},
		position = "center",
	}

	themeconfig.layout[7] = { type = "padding", val = 1 }

	themeconfig.layout[8] = {
		type = "text",
		val = {
			"Plugins listed     " .. plugs.count .. " plugins 󰗇",
			"Plugins loaded     " .. plugs.loaded .. " plugins 󰚥",
		},
		opts = { position = "center", hl = "Comment" },
	}

	return themeconfig
end

return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	lazy = true,
	event = "VimEnter",
	config = function()
		require("alpha").setup(create())
	end,
	keys = { {
		"<localleader>h",
		"<cmd>Alpha<cr>",
		mode = { "n" },
		desc = "Open the startup screen",
	} },
}
