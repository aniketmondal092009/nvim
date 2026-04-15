-- vim.opt.laststatus = 0
-- 0: never
-- 1: only if there are at least two windows
-- 2: always
-- 3: always and ONLY the last window


local component = {}

function _G._statusline_component(name)
  return component[name]()
end


local statusline = {
  '%f %h',
  '%m',
  '%r',
  '%=',
  '%-11(%l,%c%)   ',
  '%P ',
}

vim.o.statusline = table.concat(statusline, '')


