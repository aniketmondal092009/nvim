local cmp = {} -- statusline components

--- highlight pattern
-- This has three parts: 
-- 1. the highlight group
-- 2. text content
-- 3. special sequence to restore highlight: %*
-- Example pattern: %#SomeHighlight#some-text%*
local hi_pattern = '%%#%s#%s%%*'

function _G._statusline_component(name)
  return cmp[name]()
end


function cmp.position()
    local line = vim.fn.line('.')      -- current line
    local total = vim.fn.line('$')     -- total lines
    local pos

    if line == 1 then
        pos = "Top"
    elseif line == total then
        pos = "Bot"
    else
        -- middle lines → show percentage
        local percent = math.floor((line / total) * 100)
        pos = percent .. "%%"           -- e.g., "41%"
    end

    return hi_pattern:format('StatusLine', ' ' .. pos .. ' ')
end


local statusline = {
  '%t ',
  '%m',
  '%r',
  '%=',
  '%l,%-3c',
  '        %3{%v:lua._statusline_component("position")%}',
}

vim.o.statusline = table.concat(statusline, '')

