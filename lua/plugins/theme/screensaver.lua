return {
	"folke/drop.nvim",
	enabled = false, -- still feels buggy with help files
	lazy = true,
	config = true,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		theme = "auto",
		themes = {
			{ theme = "new_year", month = 1, day = 1 },
			{ theme = "valentines_day", month = 2, day = 14 },
			{ theme = "st_patricks_day", month = 3, day = 17 },
			{ theme = "easter", holiday = "easter" },
			{ theme = "april_fools", month = 4, day = 1 },
			{ theme = "us_independence_day", month = 7, day = 4 },
			{ theme = "halloween", month = 10, day = 31 },
			{ theme = "us_thanksgiving", holiday = "us_thanksgiving" },
			{ theme = "xmas", from = { month = 12, day = 24 }, to = { month = 12, day = 25 } },

			{ theme = "leaves", from = { month = 3, day = 21 }, to = { month = 6, day = 20 } },
			{ theme = "snow", from = { month = 6, day = 21 }, to = { month = 9, day = 22 } },
			{ theme = "spring", from = { month = 9, day = 23 }, to = { month = 12, day = 20 } },
			{ theme = "summer", from = { month = 12, day = 21 }, to = { month = 3, day = 20 } },

			{ theme = "ocean" },
			{ theme = "space" },
		},
		max = 100,
		interval = 90,
		screensaver = 1000 * 60 * 5,
		filetypes = {
			"dashboard",
			"alpha",
			"ministarter",
			"lazy",
			"mason",
			"man",
			"readonly",
			"nil",
			"help",
			"markdown",
		},

		winblend = 100,
	},
}
