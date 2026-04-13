local tab = "    "
local startTab = "^" .. tab
local visibility = startTab .. "\\(public\\|protected\\|private\\|\\)\\s\\{1}"
local static = "\\(static\\s\\|\\)"
local readonly = "\\(readonly\\s\\|\\)"
local constant = visibility .. "const "
local property = visibility .. static .. readonly .. "\\(?*\\w\\+\\s\\|\\)\\$"
local method = visibility .. static .. "function"
local construct = method .. " __construct("
local methodEnd = startTab .. "}"
local comment = startTab .. "\\/"
local commentMiddle = startTab .. "\\*"
local commentEnd = startTab .. "\\s\\*"
local any = startTab .. "[p}]\\{1}"
local variable = "\\(" .. tab .. "\\)\\+\\$\\w\\+\\s\\{1}=\\s\\{1}"

return {
	{
		"ta-tikoma/php.easy.nvim",
		lazy = true,
		enabled = false,
		ft = { "php" },
		dependencies = {
			"L3MON4D3/LuaSnip",
		},
		opts = {
			onAppend = {
				engine = "LuaSnip",
			},
			onSave = { -- on save php file action
				removeUnusedUses = true, -- remove unused uses (then use lsp: intelephense)
			},
			regex = { -- regex for parse php file
				tab = tab,
				startTab = startTab,
				visibility = visibility,
				static = static,
				constant = constant,
				property = property,
				method = method,
				construct = construct,
				methodEnd = methodEnd,
				comment = comment,
				commentMiddle = commentMiddle,
				commentEnd = commentEnd,
				any = any,
				variable = variable,
				object = "^\\(final class\\|abstract class\\|class\\|interface\\|trait\\|enum\\)\\s\\{1}",
			},
		},
		keys = {
			{ "-#", "<CMD>PHPEasyAttribute<CR>", ft = "php" },
			{ "-b", "<CMD>PHPEasyDocBlock<CR>", ft = "php" },
			{ "-r", "<CMD>PHPEasyReplica<CR>", ft = "php" },
			{ "-c", "<CMD>PHPEasyCopy<CR>", ft = "php" },
			{ "-d", "<CMD>PHPEasyDelete<CR>", ft = "php" },
			{ "-uu", "<CMD>PHPEasyRemoveUnusedUses<CR>", ft = "php" },
			{ "-e", "<CMD>PHPEasyExtends<CR>", ft = "php" },
			{ "-i", "<CMD>PHPEasyImplements<CR>", ft = "php" },
			{ "--i", "<CMD>PHPEasyInitInterface<CR>", ft = "php" },
			{ "--c", "<CMD>PHPEasyInitClass<CR>", ft = "php" },
			{ "--ac", "<CMD>PHPEasyInitAbstractClass<CR>", ft = "php" },
			{ "--t", "<CMD>PHPEasyInitTrait<CR>", ft = "php" },
			{ "--e", "<CMD>PHPEasyInitEnum<CR>", ft = "php" },
			{ "-c", "<CMD>PHPEasyAppendConstant<CR>", ft = "php", mode = { "n", "v" } },
			{ "-p", "<CMD>PHPEasyAppendProperty<CR>", ft = "php", mode = { "n", "v" } },
			{ "-m", "<CMD>PHPEasyAppendMethod<CR>", ft = "php", mode = { "n", "v" } },
			{ "__", "<CMD>PHPEasyAppendConstruct<CR>", ft = "php" },
			{ "_i", "<CMD>PHPEasyAppendInvoke<CR>", ft = "php" },
			{ "-a", "<CMD>PHPEasyAppendArgument<CR>", ft = "php" },
		},
	},
	{ -- Lua
		"gbprod/phpactor.nvim",
		lazy = true,
		ft = { "php" },
		enabled = false,
		build = function()
			require("phpactor.handler.update")()
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			install = {
				path = vim.fn.stdpath("data") .. "/opt/",
				branch = "master",
				bin = vim.fn.stdpath("data") .. "/opt/phpactor/bin/phpactor",
				php_bin = "php",
				composer_bin = "composer",
				git_bin = "git",
				check_on_startup = "none",
			},
			lspconfig = {
				enabled = true,
				options = {},
			},
		},
	},
}
