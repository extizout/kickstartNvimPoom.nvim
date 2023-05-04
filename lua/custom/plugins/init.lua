-- You can add your own plugins here or in other files in this directory! I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

--- [[ Neo-tree Remove Legacy Command]]
vim.g.neo_tree_remove_legacy_commands = 1
--- [[ Nightfly Vim.Global]]
vim.g.nightflyCursorColor = true

return {

  ---------------------Personal NeoVim Keymap ---------------------------------

  {
    -- [[ Native Neovim ]]
    -- Map jk to ESC in Insert Mode.
    vim.keymap.set('i', 'jk', '<ESC>', { desc = 'ESC' }),
    -- Map jk to ESC in Command Mode.
    vim.keymap.set('c', 'jk', '<ESC>', { desc = 'ESC' })
  },

  ---------------------Nvim-telescope-fzf-native install Windows ----------

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  ---------------------Nightfly Theme---------------------------------

  {
    'bluz71/vim-nightfly-colors',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'nightfly'
    end,
  },

  ---------------------Lualine----------------------------------------

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'nightfly',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  ---------------------Vim-Surround-----------------------------------

  'tpope/vim-surround',

  ---------------------Autopair---------------------------------------

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },

  ---------------------NEO-TREE---------------------------------------

  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup {
        -- In FILESYSTEM
        filesystem = {
          follow_current_file = true,
          hijack_netrw_behavior = "open_current",
          find_by_full_path_words = true,
        },

        -- Tab in FILESYSTEM Conf
        source_selector = {
          winbar = true,                         -- toggle to show selector on winbar
          statusline = false,                    -- toggle to show selector on statusline
          show_scrolled_off_parent_node = false, -- boolean
          tab_labels = {
            -- table
            filesystem = "  Files ",                             -- string | nil
            buffers = "  Buffers ",                              -- string | nil
            git_status = "  Git ",                               -- string | nil
            diagnostics = " 裂Diagnostics ",                       -- string | nil
          },
          content_layout = "start",                                 -- string
          tabs_layout = "equal",                                    -- string
          truncation_character = "…",                             -- string
          tabs_min_width = nil,                                     -- int | nil
          tabs_max_width = nil,                                     -- int | nil
          padding = 0,                                              -- int | { left: int, right: int }
          separator = { left = "▏", right = "▕" },              -- string | { left: string, right: string, override: string | nil }
          separator_active = nil,                                   -- string | { left: string, right: string, override: string | nil } | nil
          show_separator_on_edge = false,                           -- boolean
          highlight_tab = "NeoTreeTabInactive",                     -- string
          highlight_tab_active = "NeoTreeTabActive",                -- string
          highlight_background = "NeoTreeTabInactive",              -- string
          highlight_separator = "NeoTreeTabSeparatorInactive",      -- string
          highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
        }
      }
    end,

    -- [[ Configure NeoTree Keymap]]
    -- See `:help NeoTree`
    vim.keymap.set('n', '<leader>ot', '<cmd>Neotree focus filesystem left toggle reveal_force_cwd<cr>',
      { desc = '[O]pen [T]ree Filesystem' }),
    vim.keymap.set('n', '<leader>of', '<cmd>Neotree focus filesystem float toggle<cr>',
      { desc = '[O]pen [F]loat Filesystem' }),
    vim.keymap.set('n', '<leader>og', '<cmd>Neotree show git_status right toggle<cr>',
      { desc = '[O]pen [G]it Status' })
  },

  ----------------------Dashboard--------------------------------------

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- [[ Configure DashBoard ]]
        -- See `:help DashBoard`
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        },
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'} }
  },
 
  ----------------------Colorizer.lua--------------------------------------

  'norcalli/nvim-colorizer.lua',

}
