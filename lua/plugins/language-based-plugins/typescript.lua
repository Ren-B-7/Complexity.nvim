return {
	{
		"pmizio/typescript-tools.nvim",
		lazy = true,
		filetype = { "typescript", "typescriptreact", "ts", "tsx", "tsr" },
		enabled = false,
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {
			settings = {
				separate_diagnostic_server = true,
				publish_diagnostic_on = "insert_leave",
				expose_as_code_action = {},
				tsserver_path = nil,
				tsserver_plugins = {},
				tsserver_max_memory = "auto",
				tsserver_locale = "en",
				complete_function_calls = false,
				include_completions_with_insert_text = true,
				code_lens = "on",
				disable_member_code_lens = true,
				jsx_close_tag = {
					enable = false,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeCompletionsForModuleExports = true,
					quotePreference = "auto",
				},
				tsserver_format_options = {
					allowIncompleteCompletions = false,
					allowRenameOfImportPath = false,
				},
			},
		},
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		enabled = false,
		lazy = true,
		filetype = { "typescript", "typescriptreact" },
		opts = {
			auto_override_publish_diagnostics = true,
		},
	},
}
