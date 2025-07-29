-- Utility functions shared between progress reports for LSP and DAP

local m = {}
local client_notifs = {}

m.get_notif_data = function(client_id, token)
	if not client_notifs[client_id] then
		client_notifs[client_id] = {}
	end

	if not client_notifs[client_id][token] then
		client_notifs[client_id][token] = {}
	end

	return client_notifs[client_id][token]
end

m.spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

m.update_spinner = function(client_id, token)
	local notif_data = m.get_notif_data(client_id, token)

	if notif_data.spinner then
		local new_spinner = (notif_data.spinner + 1) % #m.spinner_frames
		notif_data.spinner = new_spinner

		notif_data.notification = vim.notify(nil, nil, {
			hide_from_history = true,
			icon = require("utils.nvim_notify_functions").spinner_frames[new_spinner],
			replace = notif_data.notification,
		})

		vim.defer_fn(function()
			m.update_spinner(client_id, token)
		end, 100)
	end
end

m.format_title = function(title, client_name)
	return client_name .. (#title > 0 and ": " .. title or "")
end

m.format_message = function(message, percentage)
	return (percentage and percentage .. "%\t" or "") .. (message or "")
end
