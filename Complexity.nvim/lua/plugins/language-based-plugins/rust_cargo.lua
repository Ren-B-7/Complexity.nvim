return { {
    "saecki/crates.nvim",
    lazy = true,
    enabled = false,
    event = { "BufRead Cargo.toml" },
    config = function()
        require("crates").setup()
    end,
    opts = {},
}, {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = true,  -- This plugin is already lazy
}, }
