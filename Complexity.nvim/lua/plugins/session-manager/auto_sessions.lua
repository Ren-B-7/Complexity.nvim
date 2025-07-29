return {
	"rmagatti/auto-session",
	lazy = true,
	enabled = true,
	cmd = {
		"Autosession",
		"SessionDelete",
		"SessionSave",
		"SessionRestore",
		"SessionSearch",
		"SessionPurgeOrphaned",
		"SessionDisableAutoSave",
		"SessionToggleAutoSave",
	},
	event = { "BufReadPost", "BufNewFile" },
	init = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
	opts = {
		args_allow_files_auto_save = false,
		args_allow_single_directory = true,
		auto_create = true,
		auto_restore = false,
		auto_restore_last_session = false,
		auto_save = true,
		close_unsupported_windows = true,
		continue_restore_on_error = false,
		cwd_change_handling = false,
		enabled = true,
		git_use_branch_name = true,
		lazy_support = true,
		log_level = "warn",
		root_dir = "/home/renier/.local/share/Complexity.nvim/sessions/",
		purge_after_minutes = 24 * 60,
		session_lens = {
			mappings = {
				alternate_session = { { "n" }, "<leader>sa" },
				copy_session = { { "n" }, "<leader>sy" },
				delete_session = { { "n" }, "<leader>sd" },
			},
			picker_opts = {
				layout = {
					height = 0.4,
					width = 0.4,
				},
				preset = "dropdown",
				preview = false,
			},
			previewer = true,
			session_control = {
				control_dir = "/home/renier/.local/share/Complexity.nvim/auto_session/",
				control_filename = "session_control.json",
			},
		},
	},
}
