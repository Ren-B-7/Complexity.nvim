return {
	{
		"cuducos/yaml.nvim",
		lazy = true,
		ft = { "yaml" },
		enabled = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
		},
	},
	-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved" }, {
	--   pattern = { "*.yaml" },
	--   callback = function()
	--     vim.opt_local.winbar = require("yaml_nvim").get_yaml_key_and_value()
	--   end,
	-- })

	-- require("lualine").setup({
	--   sections = {
	--     lualine_x = { require("yaml_nvim").get_yaml_key_and_value },
	--     -- etc
	--   }
	-- })

	{
		"someone-stole-my-name/yaml-companion.nvim",
		lazy = true,
		ft = { "yaml" },
		enabled = false,
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("telescope").load_extension("yaml_schema")
		end,
		opts = {
			builtin_matchers = {
				-- Detects Kubernetes files based on content
				kubernetes = { enabled = true },
				cloud_init = { enabled = true },
			},

			-- Additional schemas available in Telescope picker
			schemas = {
				--{
				--name = "Kubernetes 1.22.4",
				--uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json",
				--},
			},

			-- Pass any additional options that will be merged in the final LSP config
			lspconfig = {
				flags = {
					debounce_text_changes = 150,
				},
				settings = {
					redhat = { telemetry = { enabled = false } },
					yaml = {
						validate = true,
						format = { enable = true },
						hover = true,
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/api/json/catalog.json",
						},
						schemaDownload = { enable = true },
						schemas = {},
						trace = { server = "debug" },
					},
				},
			},
		},
		-- :Telescope yaml_schema
	},
}
