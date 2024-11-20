return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	cmd = "Snacks",
	config = function()
		local Snacks = require("snacks")
		local prev = { new_name = "", old_name = "" } -- Prevents duplicate events

		vim.api.nvim_create_autocmd("User", {
			pattern = "NvimTreeSetup",
			callback = function()
				local events = require("nvim-tree.api").events
				events.subscribe(events.Event.NodeRenamed, function(data)
					if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
						data = data
						Snacks.rename.on_rename_file(data.old_name, data.new_name)
					end
				end)
			end,
		})

		require("snacks").setup({
			words = { enabled = false },
			toggle = { enabled = false },
			notifier = { enabled = false },
			terminal = { enabled = false },
			lazygit = { enabled = false },
			git = { enabled = false },

			bigfile = { enabled = true, disabled = { "latex", "markdown" } },
			quickfile = { enabled = true },
			rename = { enabled = true },
			bufdelete = { enabled = true },
			gitbrowse = { enabled = true },

			statuscolumn = {
				enabled = true,
				left = { "mark", "sign" }, -- priority of signs on the left (high to low)
				right = { "fold", "git" }, -- priority of signs on the right (high to low)
				folds = {
					open = true, -- show open fold icons
					git_hl = true, -- use Git Signs hl for fold icons
				},
				git = {
					patterns = { "GitSign", "MiniDiffSign" },
				},
				refresh = 200, -- refresh at most every 50ms
			},
			win = {
				show = true,
				relative = "editor",
				position = "bottom",
				minimal = true,
				wo = {
					cursorcolumn = true,
					cursorline = true,
					cursorlineopt = "both",
					fillchars = "eob: ,lastline:…",
					list = false,
					listchars = "extends:…,tab:  ",
					number = false,
					relativenumber = false,
					signcolumn = "no",
					spell = false,
					winbar = "",
					statuscolumn = "",
					wrap = false,
					sidescrolloff = 0,
				},
				bo = {},
				keys = {
					q = "close",
				},
			},
		})
	end,
}
