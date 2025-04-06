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
    'Mofiqul/dracula.nvim',

    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('config.dashboard-nvim')
        end
    },

    {
        'folke/which-key.nvim',
        event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 600
        end,
        config = function() -- This is the function that runs, AFTER loading
            require('config.which-key')
        end,
    },

    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('config.harpoon')
        end,
    },

    {
        'rmagatti/auto-session',
        config = function()
            require('config.auto_session')
        end
    },

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

    {
        'tpope/vim-fugitive',
        config = function()
            require('config.vim-fugitive')
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

    -- Delete buffers without messing up window layout
    -- Use :Bdelete instead of :bdelete
    {
        'famiu/bufdelete.nvim',
        config = function()
            require('config.bufdelete')
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
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim',
        },
        config = function()
            require('config.nvim_cmp')
        end
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require('config.autopairs')
        end
    },

    {
        "kawre/neotab.nvim",
        event = "InsertEnter",
        opts = {
            -- See GitHub for default configs
        },
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
        'stevearc/aerial.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() 
            require('config.aerial')
        end
    },

    {
        'abecodes/tabout.nvim',
        lazy = false,
        config = function()
            require('config.tabout')
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "L3MON4D3/LuaSnip",
            "hrsh7th/nvim-cmp"
        },
        opt = true,  -- Set this to true if the plugin is optional
        event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
        priority = 1000,
    },
    -- Use this to prevent conflicts between tabout and LuaSnip
    {
        "L3MON4D3/LuaSnip",
        keys = function()
            -- Disable default tab keybinding in LuaSnip
            return {}
        end,
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig_old'},             -- Required
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
            -- require('config.lspconfig_old')
            -- require('config.nvim_cmp')
        end,
    },

--]]

})

