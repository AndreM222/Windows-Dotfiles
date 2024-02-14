local status, notify = pcall(require, 'notify')
if (not status) then return end

notify.setup({ background_colour = "#000000" })
vim.notify = notify

-- Notification Update
local client_notifs = {}

local function get_notif_data(client_id, token)
    if not client_notifs[client_id] then client_notifs[client_id] = {} end

    if not client_notifs[client_id][token] then client_notifs[client_id][token] = {} end

    return client_notifs[client_id][token]
end
