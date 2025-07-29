local tests = {}

tests.ui_picker = function()
	local test = {}
	local a = {
		items = { "tabs", "spaces" },
		prompt = {
			prompt = "Select tabs or spaces:",
			format_item = function(item)
				return "I'd like to choose " .. item
			end,
		},
		out = function(choice)
			if choice == "spaces" then
				vim.o.expandtab = true
			elseif choice == "tabs" then
				vim.o.expandtab = false
			end
		end,
	}
	test.test = function()
		vim.ui.select(a.items, a.prompt, a.out)
	end

	return test
end

tests.server_bind = function()
	local uv = vim.uv
	local server = uv.new_tcp()

	server:bind("0.0.0.0", 8080) -- listen on all interfaces
	server:listen(128, function(err)
		if err then
			print("Server error:", err)
		else
			print("Connected!")
		end
	end)
end

return tests
