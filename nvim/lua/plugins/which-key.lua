return {
    {
        'folke/which-key.nvim',
        event = 'VimEnter',
        dependencies = {
            'echasnovski/mini.nvim'
        },
        config = function()
            require('mini.icons').setup()
            require('which-key').setup()

            require('which-key').add {
                { '<leader>c', group = 'Code' },
                { '<leader>f', group = 'Find' },
                { '<leader>b', group = 'Buffer' },
                { '<leader>h', group = 'Harpoon' },
                { '<leader>g', group = 'Git' },
            }
        end,
    },
}
