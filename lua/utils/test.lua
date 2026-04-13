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

tests.ui_input = function()
	local test = {}
	local a = {
		prompt = "Enter value:",
		default = "10",
		completion = "file",
	}
	vim.ui.input(a, function(input)
		vim.print(input or "")
	end)
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

tests.find_format = function()
	local format_root = vim.fs.find(function(name, path)
		return name:match("clang%-format$")
	end, { limit = 1, type = "file", path = vim.fn.stdpath("config") })
	return format_root
end
return tests
