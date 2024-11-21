# Complextity.nvim
A Neovim-lua package for neovim to get everything like vscode  

## Installation
clone and paste as nvim or as Complexity.nvim (must be ran with "NVIM_APPNAME=Complexity.nvim nvim")

## Dependencies
 -- ngl im not certain about all of these, most are, some probs not  
apt-transport-https  
curl  
openssh-client  
git  
cmake  
python3  
python-is-python3  
python3.12-venv  
luarocks  
ripgrep  
npm  
diffutils  
zip  
rustup  
python3-pip  
fd-find  

# Plugins listed
Tick mark displays enabled/ disabled on default config  
## Plugin loader  
- [x] [lazy.nvim](https://github.com/folke/lazy.nvim) (gods gift)  

## Protocols
- [x] [mason.nvim](https://github.com/williamboman/mason.nvim)  

### Lsp
- [x] [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)  
- [x] [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)  
          - mason  
- [x] [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)  
- [x] [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)  
- [x] [garbage-day.nvim](https://github.com/zeioth/garbage-day.nvim)  
- [x] [lspkind.nvim](https://github.com/onsails/lspkind.nvim)  

### Completion specific  

- [x] [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  
- [x] [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)  
- [x] [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)  
- [x] [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)  
- [x] [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)  
- [x] [cmp-calc](https://github.com/hrsh7th/cmp-calc)  
- [x] [cmp-async-path](https://github.com/FelipeLema/cmp-async-path)  
- [x] [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)  
          - lua snip  
- [x] [cmp-rg](https://github.com/lukas-reineke/cmp-rg)  
          - ripgrep  
- [x] [nvim-autopairs](https://github.com/windwp/nvim-autopairs)   

### Snippets
- [x] [LuaSnip](https://github.com/L3MON4D3/LuaSnip) (snippet loader)  
- [x] [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) (snippet repo)  
- [x] [nvim-scissors](https://github.com/chrisgrieser/nvim-scissors) (snippet generator)  
          - telescope  

### Formatting
- [x] [conform.nvim](https://github.com/stevearc/conform.nvim)  
- [x] [mason-conform.nvim](https://github.com/zapling/mason-conform.nvim)  
          - mason  

### Linting
- [x] [nvim-lint](https://github.com/mfussenegger/nvim-lint)  
- [x] [mason-nvim-lint](https://github.com/rshkarin/mason-nvim-lint)  
          - mason  

### Debug adapter
- [x] [nvim-dap](https://github.com/mfussenegger/nvim-dap)  
- [x] [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim)  
          - mason  
- [x] [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)  
            - [nvim-nio](https://github.com/nvim-neotest/nvim-nio)  

- [x] [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)  

## TreeSitter
  
### Treesitter
- [x] [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (Code highlighter)  

### Treesitter additions
- [x] [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)  
- [x] [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) (highlight indent scope)  
- [x] [ts-comments.nvim](https://github.com/folke/ts-comments.nvim) (Override TS comments)  
- [x] [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) (Highlight brackets)  
          - indent blankline  

## File explorer
- [x] [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)  
- [x] [harpoon](https://github.com/ThePrimeagen/harpoon) (Move faster with marks)  
          - plenary  

## Telescope

### Telescope
- [x] [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)  

### Telescope additions  

- [x] [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)  
- [x] [telescope-frecency.nvim](https://github.com/nvim-telescope/telescope-frecency.nvim)  
- [x] [telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim)  
- [x] [telescope-luasnip.nvim](https://github.com/benfowler/telescope-luasnip.nvim)  
          - luasnip  
- [x] [telescope-git-diffs.nvim](https://github.com/paopaol/telescope-git-diffs.nvim)  
          - git  
- [x] [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide)  
          - zoxide  
- [x] [telescope-ports.nvim](https://github.com/LinArcX/telescope-ports.nvim)  
- [x] [nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua)  

## Git
- [x] [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)  
          - lazy git  
- [x] [mini-git](https://github.com/echasnovski/mini-git)  
- [x] [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)  
- [x] [neogit](https://github.com/NeogitOrg/neogit)  
          - [diffview.nvim](https://github.com/sindrets/diffview.nvim)  

## Terminal plugins
- [ ] [wezterm.nvim](https://github.com/willothy/wezterm.nvim) (auto detects to enable)  
- [x] [neoterm](https://github.com/kassio/neoterm)  
- [x] [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)  

## Sessions and projects
- [x] [auto-session](https://github.com/rmagatti/auto-session)  
- [x] [project.nvim](https://github.com/ahmedkhalf/project.nvim)  

## Window manager
- [x] [windows.nvim](https://github.com/anuvyklack/windows.nvim)  
          - [middleclass](https://github.com/anuvyklack/middleclass)  

## Breadcrumbs/ winbar
- [x] [nvim-navic](https://github.com/SmiteshP/nvim-navic)  
- [x] [barbecue.nvim](https://github.com/utilyre/barbecue.nvim)  

## Status column
- [x] [modicator.nvim](https://github.com/mawkler/modicator.nvim)  

## Bufferline
- [x] [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)  
          - [scope.nvim](https://github.com/tiagovla/scope.nvim)  

## Quality of life
- [x] [trouble.nvim](https://github.com/folke/trouble.nvim) (Show lsp/ syntax issues errors)  
- [x] [Comment.nvim](https://github.com/numToStr/Comment.nvim) (Select and deselect comment strings)  
- [x] [which-key.nvim](https://github.com/folke/which-key.nvim) (See key options)  
- [x] [aerial.nvim](https://github.com/stevearc/aerial.nvim) (easier code navigation, by class/ func)  
- [x] [snacks.nvim](https://github.com/folke/snacks.nvim) (Large file support and better loading)  
- [x] [mini.trailspace](https://github.com/echasnovski/mini.trailspace) (Highlight bad spaces)
- [x] [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim) (Select and refractor code)
          - telescope  
- [x] [neogen](https://github.com/danymat/neogen) (Auto generate annotations)  

## Folding
- [x] [fold-cycle.nvim](https://github.com/jghauser/fold-cycle.nvim) (Better keymaps for folding/ toggle folds)  
- [x] [foldsigns.nvim](https://github.com/lewis6991/foldsigns.nvim) (Fold signs)  
- [x] [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) (Much better folding and fold management)  
          - [promise-async](https://github.com/kevinhwang91/promise-async)  
          - treesitter  

## Highlights
- [x] [vim-illuminate](https://github.com/RRethy/vim-illuminate) (Highlight current word)
- [x] [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) (Highlight important comments and traverse there later)
- [X] [nvim-numbertoggle](https://github.com/sitiom/nvim-numbertoggle) (Highlights current line number)

## Popups and notifications
- [x] [mini.notify](https://github.com/echasnovski/mini.notify) (Custom notifications)  
- [x] [popup.nvim](https://github.com/nvim-lua/popup.nvim) (Better popups != notify)  
- [x] [dressing.nvim](https://github.com/stevearc/dressing.nvim) (Improves on vim.ui defaults)  


## Custom buffer and general
- [x] [flow.nvim](https://github.com/arjunmahishi/flow.nvim)
- [x] [zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
- [x] [scratch.nvim](https://github.com/swaits/scratch.nvim)
- [x] [neominimap.nvim](https://github.com/Isrothy/neominimap.nvim)
- [x] [codesnap.nvim](https://github.com/mistricky/codesnap.nvim) (Hard to get working!)  
- [x] [cheatsheet.nvim](https://github.com/doctorfree/cheatsheet.nvim)

## Custom themes, and entry screens
- [x] [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [x] [transparent.nvim](https://github.com/xiyaowong/transparent.nvim)
- [x] [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [x] [nvim](https://github.com/catppuccin/nvim)
- [ ] [catpuccin](https://github.com/catppuccin/nvim)

- [ ] [sonokai](https://github.com/sainnhe/sonokai)
- [ ] [visual_studio_code](https://github.com/askfiy/visual_studio_code)
- [ ] [rose-pine](https://github.com/rose-pine/neovim)
- [ ] [onedark.nvim](https://github.com/navarasu/onedark.nvim)
- [ ] [solarized-osaka.nvim](https://github.com/craftzdog/solarized-osaka.nvim)
- [ ] [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [ ] [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)
- [ ] [github-nvim-theme](https://github.com/projekt0n/github-nvim-theme)

- [ ] [feline.nvim](https://github.com/freddiehaddad/feline.nvim)
- [ ] [twilight.nvim](https://github.com/folke/twilight.nvim)
- [ ] [drop.nvim](https://github.com/folke/drop.nvim)

## Random used everywhere
- [x] [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [x] [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

## Plugins by language
### csharp
- [ ] [dotnet.nvim](https://github.com/MoaidHathot/dotnet.nvim)  
- [ ] [csharp.nvim](https://github.com/Ren-B-7/csharp.nvim)  
          - [structlog.nvim](https://github.com/Tastyep/structlog.nvim)  
### Lua
- [ ] [lazydev.nvim](https://github.com/folke/lazydev.nvim)  
          - [luvit-meta](https://github.com/Bilal2453/luvit-meta)  
### Rust
- [ ] [rustaceanvim](https://github.com/mrcjkb/rustaceanvim)  
- [ ] [crates.nvim](https://github.com/saecki/crates.nvim)  
### Ruby
- [ ] [vim-rails](https://github.com/tpope/vim-rails)  
### Swift
- [ ] [swift.nvim](https://github.com/m-housh/swift.nvim)  
### Typescript
- [ ] [typescript-tools-nvim](https://github.com/pmizio/typescript-tools.nvim)  
- [ ] [typescript-error-translator](https://github.com/dmmulroy/ts-error-translator.nvim)  
### Yaml
- [ ] [yaml.nvim](https://github.com/cuducos/yaml.nvim)  
- [ ] [yaml_companion](https://github.com/cuducos/someone-stole-my-name/yaml-companion.nvim)  
### Micropy
- [ ] [micropy.nvim](https://github.com/jim-at-jibba/micropython.nvim)  
          - toggleterm  
          - dressing.nvim  
### Powershell
- [ ] [powershell.nvim](https://github.com/TheLeoP/powershell.nvim)  
### PHP
- [ ] [phpactor.nvim](https://github.com/gbprod/phpactor.nvim)  
          - plenary  
          - lsp config  
- [ ] [php.easy.nvim](https://github.com/ta-tikoma/php.easy.nvim)  
          - lua snip  
### markdown
- [ ] [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)  
- [ ] [markdown-toc](https://github.com/ChuufMaster/markdown-toc)  
- [ ] [edit-markdown-table.nvim](https://github.com/kiran94/edit-markdown-table.nvim)  
          - tree sitter  
### json
- [ ] [nvim-jqx](https://github.com/gennaro-tedesco/nvim-jqx)  
### java
- [ ] [nvim-java](https://github.com/nvim-java/nvim-java)  
          - lsp config  
### go
- [ ] [go.nvim](https://github.com/ray-x/go.nvim)  
          - lsp config  
          - treesitter  
          - [guihua.lua](https://github.com/ray-x/guihua.lua)  
- [ ] [nvim-go](https://github.com/crispgm/nvim-go)  
          - lsp config  
          - plenary  
### flutter-dart-tailwind
- [ ] [rest.nvim](https://github.com/rest-nvim/rest.nvim)  
- [ ] [tailwindcss-colorizer-cmp.nvim](https://github.com/roobert/tailwindcss-colorizer-cmp.nvim)  
- [ ] [flutter-tools.nvim](https://github.com/nvim-flutter/flutter-tools.nvim)  
          - plenary  
          - dressing  
          - dap  
### cmake
- [ ] [cmake-tools.nvim](https://github.com/Civitasv/cmake-tools.nvim)  
          - cmake  
          - dap  
          - [overseer](https://github.com/stevearc/overseer.nvim)  

# Overkill much
Yes it is, but using lazy loading i have gotten loading into nvim down to 50 ms, so it still feels snappy.  
It struggles once there are many different buffers and lsps attached, but i am going to blame inneficient cli tools and lsps on that.  
If you are the kind of person to code in a multitude of languages at once and want to use this, consider slicing down on some plugins, or playing around with [garbage-day.nvim](https://github.com/garbage-day.nvim). It is already installed but setting it to aggressive will likely help you out.
# Keymaps?
Keymaps will likely be added to the wiki later.
