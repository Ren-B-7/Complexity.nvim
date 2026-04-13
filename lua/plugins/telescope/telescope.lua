local tlscp = require("telescope").load_extension
local extensions = {
	refactoring = {},
	git_command = { "git", "log", "--oneline", "--decorate", "--all", "." },
	fzf = {
		fuzzy = true,
		override_generic_sorter = true,
		override_file_sorter = true,
		case_mode = "smart_case",
	},
	aerial = {
		col1_width = 4,
		col2_width = 30,
		format_symbol = function(symbol_path, filetype)
			if filetype == "json" or filetype == "yaml" then
				return table.concat(symbol_path, ".")
			else
				return symbol_path[#symbol_path]
			end
		end,
		show_columns = "both",
	},
	zoxide = {
		prompt_title = "[ Walking on the shoulders of TJ ]",
		mappings = {
			default = {
				after_action = function(selection)
					print("Update to (" .. selection.z_score .. ") " .. selection.path)
				end,
			},
			["<C-s>"] = {
				before_action = function(selection)
					print("before C-s")
				end,
				action = function(selection)
					vim.cmd.edit(selection.path)
				end,
			},
		},
	},
}

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				lazy = true,
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
		},
		lazy = true,
		event = "UIEnter",
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,

							["<C-q>"] = actions.close,
						},
						n = {
							["<esc>"] = actions.close,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["q"] = actions.close,
						},
					},
				},
				pickers = { buffers = { show_all_buffers = true } },
				extensions = extensions,
			})
			tlscp("fzf")
		end,
	},
}
