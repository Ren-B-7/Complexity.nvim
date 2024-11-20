return {
	"rmagatti/auto-session",
	lazy = true,
	enabled = true,
	event = "VeryLazy",
	cmd = "Autosession",
	init = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
	opts = {
		{
			enabled = true,
			root_dir = vim.fn.stdpath("data") .. "/sessions/",
			auto_save = true,
			auto_restore = false,
			auto_create = true,
			allowed_dirs = nil,
			auto_restore_last_session = false,
			use_git_branch = true,
			lazy_support = true,
			bypass_save_filetypes = nil,
			close_unsupported_windows = true,
			args_allow_single_directory = true,
			args_allow_files_auto_save = false,
			continue_restore_on_error = false,
			cwd_change_handling = false,
			log_level = "warn",

			session_lens = {
				load_on_setup = true, -- Initialize on startup (requires Telescope)
				theme_conf = { -- Pass through for Telescope theme options
					layout_config = { -- As one example, can change width/height of picker
						width = 0.8, -- percent of window
						height = 0.5,
					},
				},
				previewer = true, -- File preview for session picker

				mappings = {
					-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
					-- TODO
					alternate_session = { { "n", "i" }, "<leader>sa" },
					copy_session = { { "n", "i" }, "<leader>sy" },
				},

				session_control = {
					control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
					control_filename = "session_control.json", -- File name of the session control file
				},
			},
		},
	},
}
