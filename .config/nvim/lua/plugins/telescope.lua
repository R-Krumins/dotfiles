local telescope = {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local builtin = require('telescope.builtin')
        local map = vim.keymap.set

        map('n', '<C-f>', function()
            builtin.find_files(require('telescope.themes').get_dropdown({
                preview = false
            }))
        end, { desc = "Find file"})

        map('n', '<leader>sg', builtin.live_grep, { desc = "[S]earch [G]grep"})
        map('n', '<leader>sb', builtin.buffers, { desc = "[S]earch [B]buffer"})
        map('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elp"})
        map('n', '<leader>sk', builtin.keymaps, { desc = "[S]earch [K]eymaps"})
        map('n', '<leader>st', builtin.colorscheme, { desc = "[S]earch [T]hemes"})
    end
}

return { telescope }
