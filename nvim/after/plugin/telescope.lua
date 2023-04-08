local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions
local themes = require("telescope.themes")

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            }
        }
    },
    extensions = {
        ["ui-select"] = { themes.get_dropdown({}) },
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
            -- Insert
                ["i"] = {
                    ["<C-w>"] = function() vim.cmd('normal vbd') end,
                },
                ["n"] = {
                  -- Custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                }
            }
        }
    }
}

telescope.load_extension("file_browser")
telescope.load_extension("ui-select")
telescope.load_extension('harpoon')

-- Bindings
vim.api.nvim_create_user_command(
    "ResumeSearch",
    function()
        builtin.resume()
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    "BrowseFiles",
    function()
        telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 }
        })
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    "Harpoon",
    function ()
        telescope.extensions.harpoon.marks(themes.get_dropdown({previewer = false}))
    end,
    { nargs = 0 }
)
