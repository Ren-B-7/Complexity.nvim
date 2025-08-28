return {
	"atiladefreitas/dooing",
	build = nil,
	lazy = true,
	cmd = { "Dooing", "DooingLocal" },
	config = true,
	opts = {
		-- Core settings
		save_path = vim.fn.stdpath("data") .. "/dooing_todos.json",

		-- Timestamp settings
		timestamp = {
			enabled = true, -- Show relative timestamps (e.g., @5m ago, @2h ago)
		},

		-- Window settings
		window = {
			width = 55,
			height = 20,
			border = "rounded",
			position = "top",

			padding = {
				top = 1,
				bottom = 1,
				left = 2,
				right = 2,
			},
		},

		formatting = {
			pending = {
				icon = "○",
				format = { "icon", "notes_icon", "text", "due_date", "ect" },
			},
			in_progress = {
				icon = "◐",
				format = { "icon", "text", "due_date", "ect" },
			},
			done = {
				icon = "✓",
				format = { "icon", "notes_icon", "text", "due_date", "ect" },
			},
		},

		quick_keys = true, -- Quick keys window

		notes = {
			icon = "📓",
		},

		scratchpad = {
			syntax_highlight = "markdown",
		},

		-- Per-project todos
		per_project = {
			enabled = true,
			default_filename = "dooing.json",
			auto_gitignore = false,
			on_missing = "prompt",
		},

		-- Nested tasks
		nested_tasks = {
			enabled = true,
			indent = 2,
			retain_structure_on_complete = true,
			move_completed_to_end = true,
		},

		-- Keymaps
		keymaps = {
			toggle_window = "<localleader>d", -- Toggle global todos
			open_project_todo = "<localleader>D", -- Toggle project-specific todos
			new_todo = "i",
			create_nested_task = "a", -- Create nested subtask under current todo
			toggle_todo = "x",
			delete_todo = "d",
			delete_completed = "D",
			close_window = "q",
			undo_delete = "u",
			add_due_date = "H",
			remove_due_date = "r",
			toggle_help = "?",
			toggle_tags = "t",
			toggle_priority = "<Space>",
			clear_filter = "c",
			edit_todo = "e",

			edit_tag = "e",
			edit_priorities = "p",
			delete_tag = "d",
			search_todos = "/",
			add_time_estimation = "T",
			remove_time_estimation = "R",
			import_todos = "I",
			export_todos = "E",
			remove_duplicates = "<leader>D",
			open_todo_scratchpad = "<leader>p",
			refresh_todos = "f",
			share_todos = "s",
		},

		calendar = {
			language = "en",
			icon = "",
			keymaps = {
				previous_day = "h",
				next_day = "l",
				previous_week = "k",
				next_week = "j",
				previous_month = "H",
				next_month = "L",
				select_day = "<CR>",
				close_calendar = "q",
			},
		},

		-- Priority settings
		priorities = {
			{
				name = "important",

				weight = 4,
			},
			{
				name = "urgent",
				weight = 2,
			},
		},
		priority_groups = {
			high = {
				members = { "important", "urgent" },
				color = nil,
				hl_group = "DiagnosticError",
			},
			medium = {
				members = { "important" },
				color = nil,
				hl_group = "DiagnosticWarn",
			},
			low = {
				members = { "urgent" },
				color = nil,
				hl_group = "DiagnosticInfo",
			},
		},
		hour_score_value = 1 / 8,
		done_sort_by_completed_time = false,
	},
	keys = {
		{
			"<localleader>d",
			"<cmd>Dooing<cr>",
			-- function()
			-- body
			-- end,
			mode = { "n" },
			desc = "Open the todo manager",
		},
		{
			"<localleader>D",
			"<cmd>DooingLocal<cr>",
			-- function()
			-- body
			-- end,
			mode = { "n" },
			desc = "Open project based todo manager",
		},
	},
}
