return {
    "folke/lazydev.nvim",
    lazy = true,
    ft = { "lua", "luau" },
    dependencies = {
        { "Bilal2453/luvit-meta" },
        {
            "hrsh7th/nvim-cmp",
            opts = function(_, opts)
                opts.sources = opts.sources or {}
                table.insert(opts.sources, {
                    name = "lazydev",
                    group_index = 0,
                })
            end,
        },
    },
    opts = {
        library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
    },
}
