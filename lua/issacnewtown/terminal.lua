local state = {
    split = { buf = nil, win = nil },
}

local function create_split_window(buf)
    if not (buf and vim.api.nvim_buf_is_valid(buf)) then
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win = vim.api.nvim_open_win(buf, true, {
        split = "below",
        win = -1,
        height = math.floor(vim.o.lines * 0.4),
    })

    return { buf = buf, win = win }
end

vim.keymap.set("n", "<M-m>", function()
    if not (state.split.win and vim.api.nvim_win_is_valid(state.split.win)) then
        state.split = create_split_window(state.split.buf)

        if vim.bo[state.split.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
            state.split.buf = vim.api.nvim_get_current_buf()
            state.split.win = vim.api.nvim_get_current_win()

            vim.keymap.set("n", "<esc>", function()
                if state.split.win and vim.api.nvim_win_is_valid(state.split.win) then
                    vim.api.nvim_win_hide(state.split.win)
                    state.split.win = nil
                end
            end, {
            buffer = state.split.buf,
            silent = true,
        })
        end
    else
        vim.api.nvim_set_current_win(state.split.win)
    end
end)



vim.api.nvim_create_user_command(
    'ToggleTerminal',
    function()
        if not (state.split.win and vim.api.nvim_win_is_valid(state.split.win)) then
            state.split = create_split_window(state.split.buf)

            if vim.bo[state.split.buf].buftype ~= "terminal" then
                vim.cmd.terminal()
                state.split.buf = vim.api.nvim_get_current_buf()
                state.split.win = vim.api.nvim_get_current_win()
            end
        else
            vim.api.nvim_win_hide(state.split.win)
            buffer = state.split.buf
        end
    end,
    {}
)
