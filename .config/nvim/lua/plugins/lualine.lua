return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    component_separators = "",
                    section_separators = "",
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diagnostics'},
                    lualine_c = {'filename', 'progress'},
                    lualine_x = {'lsp_status', 'filetype'},
                    lualine_y = {},
                    lualine_z = {}
                },
            })
        end
    }
}
