vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "NvimGoLintPopupPost",
	group = vim.api.nvim_create_augroup("NvimGo", { clear = true }),
	command = "wincmd p",
})

local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimports()
	end,
	group = format_sync_grp,
})

return {
	{
		"crispgm/nvim-go",
		lazy = true,
		enabled = false,
		ft = { "go", "golang", "gomod" },
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			vim.cmd("GoInstallBinaries")
			require("go").config.update_tool("quicktype", function(tool)
				tool.pkg_mgr = "yarn"
			end)

			require("lspconfig").gopls.setup({})
		end,
		opts = {
			notify = true,
			auto_format = true,
			auto_lint = true,
			linter = "revive",
			linter_flags = {},
			lint_prompt_style = "qf",
			formatter = "lsp",
			maintain_cursor_pos = false,
			test_flags = { "-v" },
			test_timeout = "30s",
			test_env = {},
			test_popup = true,
			test_popup_auto_leave = false,
			test_popup_width = 80,
			test_popup_height = 10,
			test_open_cmd = "edit",
			tags_name = "json",
			tags_options = { "json=omitempty" },
			tags_transform = "snakecase",
			tags_flags = { "-skip-unexported" },
			quick_type_flags = { "--just-types" },
		},
	},
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = true,
		enabled = false,
		ft = { "go", "golang", "gomod" },
		config = true,
		build = ':lua require("go.install").update_all_sync()',
		opts = {

			disable_defaults = false,
			go = "go",
			goimports = "gopls",
			gofmt = "gopls",
			fillstruct = "gopls",
			max_line_len = 0,
			tag_transform = false,
			tag_options = "json=omitempty",
			gotests_template = "",
			gotests_template_dir = "",
			gotest_case_exact_match = true,
			comment_placeholder = "",
			icons = { breakpoint = "🧘", currentpos = "🏃" },
			lsp_semantic_highlights = true,
			lsp_cfg = false,

			lsp_gofumpt = true,

			lsp_on_attach = nil,

			lsp_keymaps = true,
			lsp_codelens = true,

			null_ls = false,
			diagnostic = {

				hdlr = false,
				underline = true,
				virtual_text = { spacing = 2, prefix = "" },
				signs = { "", "", "", "" },
				update_in_insert = false,
			},

			lsp_document_formatting = true,

			lsp_inlay_hints = {
				enable = true,
				style = "inlay",
				only_current_line = false,
				only_current_line_autocmd = "CursorHold",
				show_variable_name = true,
				parameter_hints_prefix = "󰊕 ",
				show_parameter_hints = true,
				other_hints_prefix = "=> ",
				max_len_align = false,
				max_len_align_padding = 1,
				right_align = false,
				right_align_padding = 6,
				highlight = "Comment",
			},
			gopls_cmd = nil,
			gopls_remote_auto = true,
			gocoverage_sign = "█",
			sign_priority = 5,
			dap_debug = true,
			dap_debug_keymap = true,

			dap_debug_gui = true,
			dap_debug_vt = { enabled = true, enabled_commands = true, all_frames = true },

			dap_port = -1,
			dap_timeout = 15,
			dap_retries = 20,
			build_tags = "tag1,tag2",
			textobjects = true,
			test_runner = "go",
			verbose_tests = true,
			run_in_floaterm = true,

			floaterm = {
				posititon = "auto",
				width = 0.45,
				height = 0.98,
				title_colors = "nord",
			},
			trouble = true,
			test_efm = false,
			luasnip = true,

			on_jobstart = function(cmd)
				_ = cmd
			end,
			on_stdout = function(err, data)
				_, _ = err, data
			end,
			on_stderr = function(err, data)
				_, _ = err, data
			end,
			on_exit = function(code, signal, output)
				_, _, _ = code, signal, output
			end,
			iferr_vertical_shift = 4,
		},
	},
}
