local picker = require("telescope.pickers")
local finder = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")

local builtin = require("telescope.builtin")

local M = {}

local commands = require("issacnewtown.telescope.command_palette_entries")

local command_palette = function(opts)
    opts = opts or {}

    picker.new(opts, {
        prompt_title = "Commands Palette",
        finder = finder.new_table({
            results = commands,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.name,
                    ordinal = entry.name,
                }
            end
        }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(bufnr, map)
            actions.select_default:replace(function()
                local selection = actions_state.get_selected_entry()

                actions.close(bufnr)

                selection.value.fn()
            end)

            return true
        end
    }):find()

end


M.setup = function()
    vim.keymap.set("n", "<M-x>", function()
        local opts = require("issacnewtown.telescope.command_palette_opts")
        command_palette(opts)
    end)
end

return M

