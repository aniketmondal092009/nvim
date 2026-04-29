
-- vim.opt.laststatus = 0
-- 0: never
-- 1: only if there are at least two windows
-- 2: always
-- 3: always and ONLY the last window



local statusline = {
  '%f %h',
  '%m',
  '%r',
  '%=',
  '%-11(%l,%c%)   ',
  '%P ',
}

vim.o.statusline = table.concat(statusline, '')


