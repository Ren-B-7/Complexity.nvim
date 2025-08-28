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
		enabled = true,
		args_allow_files_auto_save = false,
		args_allow_single_directory = true,
		auto_create = true,
		auto_restore = false,
		auto_restore_last_session = false,
		auto_save = true,
		close_unsupported_windows = true,
		continue_restore_on_error = false,
		cwd_change_handling = false,
		git_use_branch_name = true,
		lazy_support = true,
		log_level = "warn",
		root_dir = vim.fn.stdpath("data") .. "/sessions/",
		purge_after_minutes = 24 * 60,
		session_lens = {
			picker_opts = {
				layout = {
					height = 0.4,
					width = 0.4,
				},
				preset = "dropdown",
				preview = true,
			},
			previewer = true,
			session_control = {
				control_dir = "/home/renier/.local/share/Complexity.nvim/auto_session/",
				control_filename = "session_control.json",
			},
		},
	},
	keys = {
		{ "<localleader>sf", "<cmd>SessionSearch<CR>", desc = "Search for saved sessions" },
		{ "<localleader>sp", "<cmd>SessionPurgeOrphaned<CR>", desc = "Removed all orphaned sessions" },
		{ "<localleader>ss", "<cmd>SessionSave<CR>", desc = "Save current session" },
		{ "<localleader>sd", "<cmd>SessionDelete<CR>", desc = "Delete current session" },
		{
			"<localleader>sdd",
			function()
				local session_dir = "/path/to/sessions"
				for _, file in ipairs(vim.fn.glob(session_dir .. "/*", 1, 1)) do
					local name = vim.fn.fnamemodify(file, ":t:r") -- filename without path & extension
					vim.cmd("AutoSession delete " .. name)
				end
			end,
			mode = { "n" },
			desc = "Delete all open sessions from auto_session",
		},
	},
}
