local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
    -- Color schemes
    {
        -- 'folke/tokyonight.nvim',
        -- 'catppuccin/nvim',
        'EdenEast/nightfox.nvim',
        -- 'phha/zenburn.nvim',
        -- 'sainnhe/everforest',
        -- 'ellisonleao/gruvbox.nvim',

        config = function()
            -- vim.cmd [[colorscheme tokyonight]]
            -- vim.cmd [[colorscheme tokyonight-day]]

            -- vim.cmd [[colorscheme catppuccin]]
            -- vim.cmd [[colorscheme catppuccin-frappe]]
            -- vim.cmd [[colorscheme catppuccin-latte]]

            -- vim.cmd [[colorscheme nightfox]]
            -- vim.cmd [[colorscheme nordfox]]
            vim.cmd [[colorscheme dayfox]]
            -- vim.cmd [[colorscheme dawnfox]]

            -- vim.cmd [[colorscheme zenburn]]
            -- require('config.color_zenburn')

            -- vim.cmd [[colorscheme everforest]]
            -- vim.cmd [[colorscheme gruvbox]]
        end
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('config.indent_blankline')
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        -- commit = 'afece9bbf960f908cbaffebaa4b5a0506e9dc8ed',
        -- dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('config.lualine')
        end
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons',
        tag = 'nightly',
        config = function()
            require('config.nvim_tree')
        end
    },

    -- Delete buffers without messing up window layout
    -- Use :Bdelete instead of :bdelete
    {
        'famiu/bufdelete.nvim',
        config = function()
            require('config.bufdelete')
        end
    },

    {
        'kylechui/nvim-surround',
        -- tag = '*', -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('config.comment')
        end
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('config.gitsigns')
        end
    },

    {
        'sindrets/diffview.nvim',
        config = function()
            -- require('config.diffview')
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- 'kyazdani42/nvim-web-devicons',
            'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope-live-grep-args.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            require('config.telescope')
        end,
    },

    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim'
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        tag = 'v0.9.1',
        build = function()
            require('nvim-treesitter.install').update({with_sync = true})
        end,
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require('config.treesitter')
        end
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        -- branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        },
        config = function()
            -- require('config.lsp')
            require('config.lsp')
            require('config.lspconfig')
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require('config.autopairs')
        end
    },

    {
        'rmagatti/auto-session',
        config = function()
            require('config.auto_session')
        end
    },

    'jwalton512/vim-blade',

--[[
    -- Display buffers as tabs
    {
        'akinsho/bufferline.nvim',
        -- dependencies = 'kyazdani42/nvim-web-devicons',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('config.bufferline')
            -- require('bufferline').setup()
        end
    },

    {
        'abecodes/tabout.nvim',
        config = function()
            require('config.tabout')
        end,
        ignore_beginning = true, -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
        exclude = {} -- tabout will ignore these filetypes
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('config.lspconfig')
        end
    },

    {
        'stevearc/aerial.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() 
            require('config.aerial')
        end
    },

    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('config.dashboard-nvim')
        end
    },
]]

})

