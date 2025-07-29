local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (" 󰁂 %d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end
-- plugins/ufo.lua or in your lazy.nvim plugin spec
return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	-- event = { "BufReadPost", "BufNewFile" }, -- ensures it's loaded after file is read
	opts = {
		open_fold_hl_timeout = 100,
		close_fold_kinds_for_ft = { default = { "imports", "comment" } },
		preview = {
			win_config = {
				border = "single",
				winhighlight = "Normal:Folded",
				winblend = 0,
			},
			mappings = {
				scrollU = "<C-u>",
				scrollD = "<C-d>",
				jumpTop = "[",
				jumpBot = "]",
			},
		},
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" } -- or "lsp" if you use LSP folding
		end,
		fold_virt_text_handler = handler,
	},
	keys = {
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
			desc = "UFO: Open all folds",
			mode = "n", -- optional, default is "n"
		},
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
			desc = "UFO: Close all folds",
			mode = "n", -- optional, default is "n"
		},
		{
			"zr",
			function()
				require("ufo").openFoldsExceptKinds({ "comment", "imports" })
			end,
			desc = "UFO: Open folds except comment/import",
			mode = "n", -- optional, default is "n"
		},
		{
			"zm",
			function()
				require("ufo").closeFoldsWith({ "comment", "imports" })
			end,
			desc = "UFO: Close comment/import folds",
			mode = "n", -- optional, default is "n"
		},
		{
			"zp",
			function()
				local ufo = require("ufo")
				local winid = ufo.peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end,
			desc = "UFO: Peek fold under cursor",
			mode = "n", -- optional, default is "n"
		},
		{
			"zc",
			function()
				local line = vim.api.nvim_win_get_cursor(0)[1]
				require("ufo").closeFolds(1, line, line)
			end,
			desc = "UFO: Close fold at cursor (context)",
			mode = "n", -- optional, default is "n"
		},
		{
			"zo",
			function()
				local line = vim.api.nvim_win_get_cursor(0)[1]
				require("ufo").openFolds(1, line, line)
			end,
			desc = "UFO: Open fold at cursor (context)",
			mode = "n", -- optional, default is "n"
		},
	},
}
