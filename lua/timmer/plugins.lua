local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    -- Color schemes
    use {
        -- 'ellisonleao/gruvbox.nvim',
        'folke/tokyonight.nvim',
        -- 'phha/zenburn.nvim',
        config = function()
            -- vim.cmd [[colorscheme zenburn]]
            vim.cmd [[colorscheme tokyonight-day]]
            -- require('zenburn').setup()
            require('tokyonight').setup()
            require('timmer.config.custom_color_opts')
        end
    }

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('timmer.config.dashboard-nvim')
        end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('timmer.config.indent_blankline')
        end,
    }

    use {
        'nvim-lualine/lualine.nvim',
        commit = 'afece9bbf960f908cbaffebaa4b5a0506e9dc8ed',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('timmer.config.lualine')
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',
        tag = 'nightly',
        config = function()
            require('timmer.config.nvim_tree')
        end
    }

    -- Delete buffers without messing up window layout
    -- Use :Bdelete instead of :bdelete
    use 'famiu/bufdelete.nvim'

    -- Display buffers as tabs
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('timmer.config.bufferline')
            -- require('bufferline').setup()
        end
    }

    use {
        'kylechui/nvim-surround',
        tag = '*', -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('timmer.config.comment')
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('timmer.config.gitsigns')
        end
    }

    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'nvim-telescope/telescope-live-grep-args.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        },
        config = function()
            require('timmer.config.telescope')
        end,
    })

    use {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim'
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        tag = 'v0.9.1',
        run = function()
            require('nvim-treesitter.install').update({with_sync = true})
        end,
        requires = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require('timmer.config.treesitter')
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        -- branch = 'v2.x',
        requires = {
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
            require('timmer.config.lsp')
        end,
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require('timmer.config.autopairs')
        end
    }

    use {
        'abecodes/tabout.nvim',
        config = function()
            require('timmer.config.tabout')
        end,
        ignore_beginning = true, -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
        exclude = {} -- tabout will ignore these filetypes
    }

--[[
    use ({
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('timmer.config.lspconfig')
        end
    })

    use {
        'stevearc/aerial.nvim',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function() 
            require('timmer.config.aerial')
        end
    }
]]

    if packer_bootstrap then
        require('packer').sync()
    end

end)

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua nested source <afile> | PackerSync
    augroup end
]])

