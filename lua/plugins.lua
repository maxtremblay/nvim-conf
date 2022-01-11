local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Explorer tree
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'nvim-tree'.setup {} end
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Language server protocol
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'ray-x/lsp_signature.nvim'

  -- Programming language support
  use 'ziglang/zig.vim'
  use 'ollykel/v-vim'

  -- Colorscheme and syntax
  use 'rmehri01/onenord.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'folke/tokyonight.nvim'

  -- Telescope (fuzzy finder and pickers)
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Terminal
  use 'akinsho/toggleterm.nvim'

  -- Auto comments
  use 'b3nj5m1n/kommentary'

  -- Better motions
  use 'ggandor/lightspeed.nvim'

  -- Utils
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Neorg
  use {
    "nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
            -- Tell Neorg what modules to load
            load = {
                ["core.defaults"] = {}, -- Load all the default modules
                ["core.norg.concealer"] = {}, -- Allows for use of icons
                ["core.norg.dirman"] = { -- Manage your directories with Neorg
                    config = {
                        workspaces = {
                            my_workspace = "~/Notes"
                        }
                    }
                },
                ["core.norg.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                    }
                },
                ["core.keybinds"] = {
                    config = {
                        default_keybinds = true,
                        neorg_leader = "<Leader>o"
                    }
                }
            },
        }
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

