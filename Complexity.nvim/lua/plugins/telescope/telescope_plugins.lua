local tlscp = require("telescope").load_extension

return {
	{
		"debugloop/telescope-undo.nvim",
		lazy = true,
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			},
		},
		-- opts = {
		--     -- don't use `defaults = { }` here, do this in the main telescope spec
		--     extensions = {
		--         undo = {
		--             -- telescope-undo.nvim config, see below
		--         },
		--         -- no other extensions here, they can have their own spec too
		--     },
		-- },
		config = function()
			-- Calling telescope's setup from multiple specs does not hurt, it will happily merge the configs
			-- require("telescope").setup(opts)
			tlscp("undo")
		end,
	},
	{
		"jvgrootveld/telescope-zoxide",
		lazy = true,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			tlscp("zoxide")
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		lazy = true,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			tlscp("frecency")
		end,
	},
	{
		-- Needs more work
		"LinArcX/telescope-ports.nvim",
		lazy = true,
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			},
		},
		config = function()
			tlscp("ports")
		end,
	},
	{
		"paopaol/telescope-git-diffs.nvim",
		lazy = true,
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			},
		},
		config = function()
			tlscp("git_diffs")
		end,
	},
	{
		"benfowler/telescope-luasnip.nvim",
		lazy = true,
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			},
		},
		config = function()
			tlscp("luasnip")
		end,
	},
	{
		"tiagovla/scope.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		lazy = true,
		config = function()
			tlscp("scope")
		end,
	},
}
