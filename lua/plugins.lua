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
    'folke/tokyonight.nvim',
    'catppuccin/nvim',
    'EdenEast/nightfox.nvim',
    'phha/zenburn.nvim',
    'sainnhe/everforest',
    'ellisonleao/gruvbox.nvim',

    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        config = function()
            require('config.indent_blankline')
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
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

    {
        'stevearc/oil.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('config.oil')
        end
    },

    {
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup({})
        end
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('config.comment')
        end
    },

    'tpope/vim-fugitive',

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

    -- Delete buffers without messing up window layout
    -- Use :Bdelete instead of :bdelete
    {
        'famiu/bufdelete.nvim',
        config = function()
            require('config.bufdelete')
        end
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
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
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            -- {'hrsh7th/cmp-buffer'},       -- Optional
            -- {'hrsh7th/cmp-path'},         -- Optional
            -- {'saadparwaiz1/cmp_luasnip'}, -- Optional
            -- {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            -- {'rafamadriz/friendly-snippets'}, -- Optional
        },
        config = function()
            require('config.lsp_zero')
            -- require('config.lsp')
            -- require('config.lspconfig')
            -- require('config.nvim_cmp')
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

    -- PHP specific
    'jwalton512/vim-blade',

--[[
    {
        -- Getting errors trying to use this
        'ccaglak/namespace.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('config.namespace')
        end
    }

    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('config.barbar')
        end
    },

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
        'abecodes/tabout.nvim',
        config = function()
            require('config.tabout')
        end,
        ignore_beginning = true, -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
        exclude = {} -- tabout will ignore these filetypes
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
--]]

})

