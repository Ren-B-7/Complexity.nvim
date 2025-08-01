local custom_providers = {}

custom_providers.os_icon = function(name, fallback)
	fallback = fallback or "NONE"
	name = name or vim.uv.os_environ().DESKTOP_SESSION
	local icon = " "
	if vim.g.nvim_web_devicons ~= 0 then
		icon = require("nvim-web-devicons").get_icon(name, fallback, { default = false })
	end
	return (icon ~= " " and " " .. icon .. " " or icon)
end

custom_providers.os_type = function()
	local os_name = vim.uv.os_environ().DESKTOP_SESSION
	local os_out_name = os_name:lower():gsub("^%l", string.upper)
	return custom_providers.os_icon(os_name, os_out_name) .. os_out_name
end

custom_providers.os_info = function()
	local os = vim.bo.fileformat:upper()
	local icon
	if os == "UNIX" then
		icon = custom_providers.os_icon("linux")
	elseif os == "MAC" then
		icon = custom_providers.os_icon("apple")
	else
		icon = custom_providers.os_icon("windows")
	end
	return os .. icon
end

custom_providers.curr_window = function()
	return vim.api.nvim_win_get_number(0)
end

custom_providers.diff_source = function()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

custom_providers.keymap = function()
	if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
		return "⌨ " .. vim.b.keymap_name
	end
	return ""
end

local function start_feline(_, opts)
	local palette = require("catppuccin.palettes").get_palette()

	local theme = {
		bg = palette.crust,
		none = palette.crust,
		fg = palette.text,
		text = palette.text,
		red = palette.red,
		yellow = palette.yellow,
		peach = palette.peach,
		blue = palette.blue,
		cyan = palette.sky,
		green = palette.green,
		bg2 = palette.mantle,
		white = "white",
	}
	local EMPTY_SEP = { str = " ", hl = { fg = theme.none, bg = theme.bg } }
	local vi_feline_mode = require("feline.providers.vi_mode")

	local comp = {
		mode = {
			name = "mode",
			provider = { name = "vi_mode", opts = { show_mode_name = true, padding = "right" } },
			hl = function()
				return {
					name = vi_feline_mode.get_mode_highlight_name(),
					fg = vi_feline_mode.get_mode_color(),
					bg = theme.bg,
					style = "bold",
				}
			end,
		},
		file_info = {
			name = "file info",
			provider = "file_info",
			hl = {
				fg = theme.red,
				bg = theme.bg,
				style = "bold",
			},
			left_sep = EMPTY_SEP,
			right_sep = EMPTY_SEP,
		},
		file_size = {
			name = "file size",
			provider = "file_size",
			hl = {
				fg = theme.text,
				bg = theme.bg,
			},
			left_sep = {
				{
					str = "slant_right_2_thin",
					hl = {
						fg = theme.text,
						bg = theme.bg,
					},
				},
				EMPTY_SEP,
			},
			right_sep = {
				EMPTY_SEP,
				{
					str = "slant_left_2_thin",
					hl = {
						fg = theme.text,
						bg = theme.bg,
					},
				},
			},
		},
		pos = {
			name = "position",
			provider = "position",
			hl = {
				fg = theme.text,
				bg = theme.bg,
			},
			left_sep = EMPTY_SEP,
			right_sep = {
				EMPTY_SEP,
				{
					str = "slant_right_2_thin",
					hl = {
						fg = theme.text,
						bg = theme.bg,
					},
				},
			},
		},
		lsp = {
			errors = {
				provider = "diagnostic_errors",
				hl = { fg = theme.red, bg = theme.bg },
			},
			warnings = {
				provider = "diagnostic_warnings",
				hl = { fg = theme.peach, bg = theme.bg },
			},
			hints = {
				provider = "diagnostic_hints",
				hl = { fg = theme.cyan, bg = theme.bg },
			},
			info = {
				provider = "diagnostic_info",
				hl = { fg = theme.green, bg = theme.bg },
			},
		},
		git = {
			branch = {
				provider = "git_branch",
				hl = {
					fg = theme.text,
					bg = theme.bg,
					style = "bold",
				},
				right_sep = EMPTY_SEP,
			},
			diff_added = {
				provider = "git_diff_added",
				hl = {
					fg = theme.green,
					bg = theme.bg,
				},
			},
			diff_changed = {
				provider = "git_diff_changed",
				hl = {
					fg = theme.peach,
					bg = theme.bg,
				},
			},
			diff_removed = {
				provider = "git_diff_removed",
				hl = {
					fg = theme.red,
					bg = theme.bg,
				},
			},
		},
		line_percentage = {
			name = "percent",
			provider = "line_percentage",
			hl = {
				fg = theme.white,
				bg = theme.bg,
				style = "bold",
			},
			left_sep = EMPTY_SEP,
			right_sep = EMPTY_SEP,
		},
		scroll_bar = {
			provider = "scroll_bar",
			hl = {
				fg = theme.cyan,
				bg = theme.bg,
				style = "bold",
			},
		},
		type = {
			name = "file type",
			provider = "file_type",
			hl = {
				fg = theme.white,
				bg = theme.blue,
				style = "bold",
			},
			left_sep = {
				str = " ",
				hl = { fg = theme.bg, bg = theme.blue },
			},
			right_sep = {
				str = "slant_right",
				hl = { bg = theme.bg, fg = theme.blue },
			},
		},
		os_ver = {
			name = "OS info",
			hl = {
				fg = theme.peach,
				bg = theme.bg,
				style = "italic",
			},
			left_sep = EMPTY_SEP,
			right_sep = EMPTY_SEP,
			provider = custom_providers.os_info(),
		},
		os_type = {
			name = "OS type",
			hl = {
				fg = theme.peach,
				bg = theme.bg,
				style = "italic",
			},
			left_sep = EMPTY_SEP,
			right_sep = EMPTY_SEP,
			provider = custom_providers.os_type(),
		},
		empty = { provider = " ", hl = { fg = theme.none, bg = theme.bg } },
	}

	local active_status = {
		{ --left
			comp.empty,
			comp.mode,
			comp.file_size,
			comp.pos,
			comp.lsp.errors,
			comp.lsp.warnings,
			comp.lsp.hints,
			comp.lsp.info,
			comp.empty,
		},
		{ --mid
			comp.empty,
			comp.os_type,
			comp.file_info,
			comp.os_ver,
			comp.empty,
		},
		{ --right
			comp.empty,
			comp.git.branch,
			comp.git.diff_added,
			comp.git.diff_changed,
			comp.git.diff_removed,
			comp.line_percentage,
			comp.scroll_bar,
		},
	}

	local inactive_status = {
		{ comp.type, comp.empty },
		{ comp.empty, comp.os_type, comp.file_info, comp.os_ver, comp.empty },
		{ comp.empty, comp.line_percentage, comp.scroll_bar },
	}

	local shortened_status = { { comp.type, comp.empty }, {}, { comp.empty, comp.line_percentage } }

	local conditional = {}

	local inactive = {
		ft = {},
		bt = {},
		bn = {},
	}

	local disabled = {
		ft = { "^lazy$", "^NvimTree$" },
		bt = { "^terminal$" },
		bn = {},
	}

	opts.components = { active = active_status, inactive = inactive_status }
	opts.conditional_components = { conditional.nvimtree_custom }

	opts.force_inactive = { filetypes = inactive.ft, buftypes = inactive.bt, bufnames = inactive.bn }
	opts.disable = { filetypes = disabled.ft, buftypes = disabled.bt, bufnames = disabled.bn }

	require("feline").setup(opts)
end

local function start_lualine(_, opts)
	opts = {
		options = {
			icons_enabled = true,
			theme = "catppuccin",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = { "NvimTree", "Alpha", "Mason", "Lazy" },
				winbar = { "NvimTree", "Alpha", "Mason", "Lazy" },
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = false,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", { "diff", source = custom_providers.diff_source }, "diagnostics" },
			lualine_c = { custom_providers.os_type, "filename" },
			lualine_x = { "filetype", custom_providers.os_info },
			lualine_y = { custom_providers.keymap, "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = { "bo:filetype", "filesize" },
			lualine_b = { "branch", { "diff", source = custom_providers.diff_source }, "diagnostics" },
			lualine_c = { custom_providers.keymap },
			lualine_x = {},
			lualine_y = { custom_providers.os_type, custom_providers.os_info },
			lualine_z = { "filename", "progress" },
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	}
	require("lualine").setup(opts)
end

return {
	{
		"freddiehaddad/feline.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		enabled = false,
		lazy = true,
		event = "UIEnter",
		config = start_feline,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		config = start_lualine,
	},
}
