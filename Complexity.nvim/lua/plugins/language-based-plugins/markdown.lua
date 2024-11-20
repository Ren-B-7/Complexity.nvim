return {
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		enabled = false,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_command_for_global = 0
			vim.g.mkdp_open_to_the_world = 0
			vim.g.mkdp_open_ip = ""
			vim.g.mkdp_browser = ""
			vim.g.mkdp_echo_preview_url = 0
			vim.g.mkdp_browserfunc = ""
			vim.g.mkdp_preview_options = {
				mkit = {},
				katex = {},
				uml = {},
				maid = {},
				disable_sync_scroll = 0,
				sync_scroll_type = "middle",
				hide_yaml_meta = 1,
				sequence_diagrams = {},
				flowchart_diagrams = {},
				content_editable = false,
				disable_filename = 0,
				toc = {},
			}
			vim.g.mkdp_markdown_css = ""
			vim.g.mkdp_highlight_css = ""
			vim.g.mkdp_port = ""
			vim.g.mkdp_page_title = "「${name}」"
			vim.g.mkdp_images_path = "/home/user/.markdown_images"
			vim.g.mkdp_fts = { "markdown" }
			vim.g.mkdp_theme = "dark"
			vim.g.mkdp_combine_preview = 0
			vim.g.mkdp_combine_preview_auto_refresh = 1
		end,
	},
	{
		"ChuufMaster/markdown-toc",
		lazy = true,
		enabled = false,
		ft = { "markdown" },
		config = true,
		opts = {
			-- The heading level to match (i.e the number of "#"s to match to) max 6
			heading_level_to_match = -1,

			-- Set to True display a dropdown to allow you to select the heading level
			ask_for_heading_level = false,

			-- TOC default string
			toc_format = "%s- [%s](<%s#%s>)",
		},
	},
	{
		"kiran94/edit-markdown-table.nvim",
		lazy = true,
		enabled = false,
		ft = { "markdown" },
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "EditMarkdownTable",
	},
}
