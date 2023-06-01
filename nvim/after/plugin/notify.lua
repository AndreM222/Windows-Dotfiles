local status, notify = pcall(require, 'notify')
if (not status) then return end
local status2, dap = pcall(require, "dap")
if (not status2) then return end

notify.setup({ background_colour = "#000000" })

vim.notify = notify

-- Notification update
local client_notifs = {}

local function get_notif_data(client_id, token)
    if not client_notifs[client_id] then client_notifs[client_id] = {} end

    if not client_notifs[client_id][token] then client_notifs[client_id][token] = {} end

    return client_notifs[client_id][token]
end

local spinner_frames = { "󰨔", "󰕞", "󰕣", "󱡗", "󱡖", "󱡗", "󰕣", "󰕞" }

local function update_spinner(client_id, token)
    local notif_data = get_notif_data(client_id, token)

    if notif_data.spinner then
        local new_spinner = (notif_data.spinner + 1) % #spinner_frames
        notif_data.spinner = new_spinner

        notif_data.notification = vim.notify(nil, nil, {
            hide_from_history = true,
            icon = spinner_frames[new_spinner],
            replace = notif_data.notification,
        })

        vim.defer_fn(function() update_spinner(client_id, token) end, 100)
    end
end

local function format_title(title, client_name)
    return client_name .. (#title > 0 and ": " .. title or "")
end

local function format_message(message, percentage)
    return (percentage and percentage .. "%\t" or "") .. (message or "")
end

-- Lsp integration

vim.api.nvim_create_autocmd("User", {
    pattern = "LspProgressUpdate",
    callback = function()
        local lsp = vim.lsp.util.get_progress_messages()[1]

        if not lsp then return end

        -- Startup null-ls notification
        if lsp.title == "diagnostics_on_open" and lsp.name == "null-ls" and lsp.message then
            vim.notify("Complete: " .. lsp.message, "info", {
                title = format_title(lsp.title, lsp.name),
                icon = ""
            })
        end

        -- Lsp progress notifications
        if lsp.done and lsp.title ~= "diagnostics" then
            if lsp.message then
                vim.notify("Complete: " .. lsp.message, "info", {
                    title = format_title(lsp.title, lsp.name),
                    icon = ""
                })
            else
                vim.notify("Complete", "info", {
                    title = format_title(lsp.title, lsp.name),
                    icon = ""
                })
            end
        end
    end
})

-- DAP integration

dap.listeners.before['event_progressStart']['progress-notifications'] = function(session, body)
    local notif_data = get_notif_data("dap", body.progressId)

    local message = format_message(body.message, body.percentage)
    notif_data.notification = vim.notify(message, "info", {
        title = format_title(body.title, session.config.type),
        icon = spinner_frames[1],
        timeout = false,
        hide_from_history = false
    })

    notif_data.notification.spinner = 1,
        update_spinner("dap", body.progressId)
end

dap.listeners.before['event_progressUpdate']['progress-notifications'] = function(session, body)
    local notif_data = get_notif_data("dap", body.progressId)
    notif_data.notification = vim.notify(format_message(body.message, body.percentage), "info", {
        replace = notif_data.notification,
        hide_from_history = false
    })
end

dap.listeners.before['event_progressEnd']['progress-notifications'] = function(session, body)
    local notif_data = client_notifs["dap"][body.progressId]
    notif_data.notification = vim.notify(body.message and format_message(body.message) or "Complete", "info", {
        icon = "",
        replace = notif_data.notification,
        timeout = 3000
    })
    notif_data.spinner = nil
end
