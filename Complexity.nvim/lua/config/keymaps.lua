local set = vim.keymap.set
local del = vim.keymap.del

-- lsp
local lsp = vim.lsp.buf
local diagn = vim.diagnostic

-- imports
local functions = require("utils.functions")
local snacks = require("snacks")

-- harpoon keymaps
set("n", "<leader>az", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle Harpoon quick menu" })
set("n", "<leader>aa", function()
	require("harpoon.mark").add_file()
end, { desc = "Add file to Harpoon" })
set("n", "<leader>aj", function()
	require("harpoon.ui").nav_next()
end, { desc = "Navigate to next Harpoon file" })
set("n", "<leader>ak", function()
	require("harpoon.ui").nav_prev()
end, { desc = "Navigate to previous Harpoon file" })

-- lsp keymaps
set("n", "gd", lsp.definition, { desc = "Go to definition" })
set("n", "K", lsp.hover, { desc = "Show LSP hover information" })
set("n", "<leader>vs", lsp.workspace_symbol, { desc = "Search workspace symbols" })
set("n", "<leader>vd", diagn.open_float, { desc = "Open diagnostics float" })
set("n", "[d", diagn.goto_next, { desc = "Go to next diagnostic" })
set("n", "]d", diagn.goto_prev, { desc = "Go to previous diagnostic" })
set("n", "<leader>ca", lsp.code_action, { desc = "Show code actions" })
set({ "n", "v" }, "<leader>gr", lsp.references, { desc = "Find references" })
set({ "n", "v" }, "<leader>rn", lsp.rename, { desc = "Rename symbol" })

-- Trouble keymaps
set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
set("n", "<leader>xf", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
set(
	"n",
	"<leader>xT",
	"<cmd>Trouble todo toggle filter = {tag = {TODO,"
		.. "FIX,"
		.. "TEST,"
		.. "REMEMBER,"
		.. "WARNING,"
		.. "XXX,"
		.. "FIXME,"
		.. "FIXIT,"
		.. "ISSUE,"
		.. "BUG,"
		.. "TESTING,"
		.. "INFO}}<CR>",
	{ desc = "ALL comment List (Trouble)" }
)

set("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "TODO List (Trouble)" })
set("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix List (Trouble)" })
set(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)

-- file tree
set("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle tree view" })
set("n", "<leader>h", "<C-\\><C-N><C-w>h", { desc = "Focus on NvimTree" })

-- navigation
set("n", "gt", ":bnext<CR>", { desc = "Go to next buffer" })
set("n", "tg", ":bprev<CR>", { desc = "Go to previous buffer" })

set("n", "<localleader>tm", functions.toggle_modifiable, { desc = "Toggle modifiable option" })
set("n", "<localleader>tl", functions.toggle_list_and_col, { desc = "Toggle whitespace and line length display" })
set("n", "<localleader>tf", functions.toggle_format_on_save, { desc = "Toggle format on save" })

-- git commands
set({ "n", "x" }, "<localleader>go", "<cmd>Neogit<CR>", { desc = "Open neogit" })
set({ "n", "x" }, "<localleader>gc", "<cmd>Neogit commit<CR>", { desc = "Open neogit commit buffer" })
set({ "n", "x" }, "<localleader>gt", "<cmd>Neogit tag<CR>", { desc = "Open neogit tag buffer" })
set({ "n", "x" }, "<localleader>gl", "<cmd>Neogit log<CR>", { desc = "Open neogit log" })

-- Moving and resizing windows
set("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
set("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height" })
set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Split windows in different directions
set({ "n" }, "<localleader-Left>", ":leftabove vsplit<CR>", { desc = "Split left" })
set({ "n" }, "<localleader-Right>", ":rightbelow vsplit<CR>", { desc = "Split right" })
set({ "n" }, "<localleader-Up>", ":aboveleft split<CR>", { desc = "Split up" })
set({ "n" }, "<localleader-Down>", ":belowright split<CR>", { desc = "Split down" })

-- terminal resize
set("t", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Decrease terminal height" })
set("t", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Increase terminal height" })
set("t", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease terminal width" })
set("t", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase terminal width" })

-- Switching windows
set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- terminal window movements
set("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left terminal" })
set("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to bottom terminal" })
set("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to top terminal" })
set("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right terminal" })

-- terminal create/ destroy commands
set(
	{ "n", "t", "v" },
	"<leader>tv",
	"<cmd>ToggleTerm direction=vertical<CR>",
	{ desc = "Create new vertical terminal" }
)
set(
	{ "n", "t", "v" },
	"<leader>th",
	"<cmd>ToggleTerm direction=horizontal<CR>",
	{ desc = "Create new horizontal terminal" }
)
set({ "n", "t", "v" }, "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Create new hover terminal" })

set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- moving blocks of text
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- easy indenting
set("v", "<", "<gv", { desc = "Indent left" })
set("v", ">", ">gv", { desc = "Indent right" })

-- easy buffer change
set("n", "<TAB>", "<cmd>bn<CR>", { desc = "Move to next buffer" })
set("n", "<S-TAB>", "<cmd>bp<CR>", { desc = "Move to previous buffer" })

set("n", "<leader>nf", "<cmd> NvimTreeFindFile <CR>", { desc = "Navigate to current file with tree" })

set({ "n", "v", "x" }, "<leader>`", "<cmd>TransparentToggle<CR>", { desc = "Toggle transparent screen" })

set("n", "<C-+>", "<cmd>WindowsMaximize<CR>", { desc = "" })
set("n", "<C-_>", "<cmd>WindowsMaximizeVertically<CR>", { desc = "" })
set("n", "<C-|>", "<cmd>WindowsMaximizeHorizontally<CR>", { desc = "" })
set("n", "<C-=>", "<cmd>WindowsEqualize<CR>", { desc = "" })

set({ "n" }, "<leader>sf", "<cmd>SessionSearch<CR>", { desc = "Search for saved sessions" })
set({ "n" }, "<leader>sp", "<cmd>SessionPurgeOrphaned<CR>", { desc = "Removed all orphaned sessions" })
set({ "n" }, "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save current session" })
set({ "n" }, "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "Delete current session" })

local open = function()
	return require("fold-cycle").open()
end
local close = function()
	return require("fold-cycle").close()
end

set("n", "<localleader>co", open, { desc = "Fold-cycle: open folds" })
set("n", "<leader><Right>", open, { desc = "Fold-cycle: open folds" })

set("n", "<localleader>cc", close, { desc = "Fold-cycle: close folds" })
set("n", "<leader><Left>", close, { desc = "Fold-cycle: close folds" })

set("n", "<localleader>cO", function()
	return require("fold-cycle").open_all()
end, { remap = true, silent = true, desc = "Fold-cycle: open folds" })

set("n", "<localleader>cC", function()
	return require("fold-cycle").close_all()
end, { remap = true, silent = true, desc = "Fold-cycle: close all folds" })

set("n", "<localleader>h", "<cmd>Alpha<CR>", { desc = "Load startup screen" })

set("n", "<localleader>mt", "<cmd>Neominimap Toggle<CR>", { desc = "Toggle the minimap" })
set("n", "<localleader>mf", "<cmd>Neominimap Focus<CR>", { desc = "Focus on minimap" })

set("n", "<leader>bd", function()
	snacks.bufdelete()
end, { desc = "Delete Buffer" })

set("n", "<leader>bo", function()
	snacks.bufdelete.other()
end, { desc = "Delete Other Buffer" })

set("n", "<leader>bq", function()
	snacks.bufdelete.all()
end, { desc = "Delete All Buffers" })

set("n", "<leader>gb", function()
	snacks.gitbrowse()
end, { desc = "Git Browse" })

set("n", "<leader><Bs>", "<cmd>lua require('barbecue.ui').navigate(-1)<CR>", { desc = "Navigate backwards by keyword" })
