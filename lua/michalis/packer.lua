-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({
        "neanias/everforest-nvim",
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup()
        end,
    })

    use('nvim-treesitter/nvim-treesitter', {'run = TSUpdate'})
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    })

    use({"akinsho/toggleterm.nvim",
    tag = '*',
    opts = {
        shading_factor = 0,
        hide_numbers = true,
    },
    cmd="ToggleTerm",
    config = function(_,opts)
        local function set_terminal_keymaps()
            local map = vim.api.nvim_buf_set_keymap
            local map_opts = {
                noremap = true,
            }
            map(0, "t", "<esc>", [[<C-\><C-n>]], map_opts)
            map(0, "t", "<A-h>", [[<C-\><C-n><C-W>h]], map_opts)
            map(0, "t", "<A-j>", [[<C-\><C-n><C-W>j]], map_opts)
            map(0, "t", "<A-k>", [[<C-\><C-n><C-W>k]], map_opts)
            map(0, "t", "<A-l>", [[<C-\><C-n><C-W>l]], map_opts)
            map(0, "t", "<A-Right>", [[<cmd>wincmd 2> <cr>]], map_opts)
            map(0, "t", "<A-Up>", [[<cmd>wincmd 2+ <cr>]], map_opts)
            map(0, "t", "<A-Down>", [[<cmd>wincmd 2- <cr>]], map_opts)
            map(0, "t", "<A-Left>", [[<cmd>wincmd 2< <cr>]], map_opts)
            map(0, "n", "<Tab>", "<Nop>", map_opts)
            map(0, "n", "<S-Tab>", "<Nop>", map_opts)
        end
        vim.api.nvim_create_autocmd("TermOpen", { pattern = "term://*", callback = set_terminal_keymaps })
        require("toggleterm").setup(opts)
    end
})

use({
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
})
end)

