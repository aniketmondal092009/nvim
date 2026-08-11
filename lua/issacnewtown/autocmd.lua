

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})


vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand("~/.config/hypr/hypridle.conf"),
  callback = function()
    vim.fn.system("pkill hypridle")
    vim.fn.system("hypridle >/dev/null 2>&1 &")
  end,
})


vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand("~/.config/hypr/hyprpaper.conf"),
  callback = function()
    vim.fn.system("pkill hyprpaper")
    vim.fn.system("hyprpaper >/dev/null 2>&1 &")
  end,
})
