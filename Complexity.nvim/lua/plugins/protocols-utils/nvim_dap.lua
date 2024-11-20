return {
	"mfussenegger/nvim-dap",
	enabled = true,
	lazy = true,
	dependencies = {
		{ "jay-babu/mason-nvim-dap.nvim", dependencies = { "williamboman/mason.nvim" } },
		"theHamsta/nvim-dap-virtual-text",
		{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
	},
	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = { },
		})

		require("nvim-dap-virtual-text").setup({
			virt_lines = true,
			show_stop_reason = true,
			enabled = true,
			enabled_commands = true,
			all_refferences = true,
			clear_on_continue = true,
			commented = false,
			only_first_definition = false,
			display_callback = function(variable)
				-- This just tries to mitigate the chance that I leak tokens here.
				local name = string.lower(variable.name)
				local value = string.lower(variable.value)
				if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
					return "*****"
				end

				if #variable.value > 15 then
					return " " .. string.sub(variable.value, 1, 15) .. "... "
				end

				return " " .. variable.value
			end,
		})

		local dap = require("dap")
		local ui = require("dapui")

		require("dapui").setup()

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end,
	keys = {
		{
			"<space>gdb",
			function()
				require("dap").run_to_cursor()
			end,
			mode = "n",
			desc = "Run to Cursor",
		},
		{
			"<Leader>B",
			function()
				require("dap").set_breakpoint()
			end,
			mode = "n",
			desc = "Set Breakpoint",
		},
		{
			"<Leader>dl",
			function()
				require("dap").run_last()
			end,
			mode = "n",
			desc = "Run Last",
		},
		{
			"<Leader>dh",
			function()
				require("dap.ui.widgets").hover()
			end,
			mode = { "n", "v" },
			desc = "Hover Widget",
		},
		{
			"<Leader>df",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end,
			mode = "n",
			desc = "Centered Frames Widget",
		},
		{
			"<Leader>ds",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end,
			mode = "n",
			desc = "Centered Scopes Widget",
		},
		-- Uncomment to enable variable evaluation under cursor
		-- { "<space>?", function() require("dapui").eval(nil, { enter = true }) end, mode = "n", desc = "Evaluate Expression" },
		{
			"<F1>",
			function()
				require("dap").continue()
			end,
			mode = "n",
			desc = "Continue",
		},
		{
			"<F2>",
			function()
				require("dap").step_into()
			end,
			mode = "n",
			desc = "Step Into",
		},
		{
			"<F3>",
			function()
				require("dap").step_over()
			end,
			mode = "n",
			desc = "Step Over",
		},
		{
			"<F4>",
			function()
				require("dap").step_out()
			end,
			mode = "n",
			desc = "Step Out",
		},
		{
			"<F5>",
			function()
				require("dap").step_back()
			end,
			mode = "n",
			desc = "Step Back",
		},
		{
			"<F12>",
			function()
				require("dap").restart()
			end,
			mode = "n",
			desc = "Restart",
		},
	},
}
