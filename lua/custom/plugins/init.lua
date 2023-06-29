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
    vim.keymap.set('c', 'jk', '<ESC>', { desc = 'ESC' }),

    -- Map ]t for Change to next tab.
    vim.keymap.set('n', ']t', '<cmd>tabnext<cr>', { desc = 'Change to next [t]ab.' }),
    -- Map [t for Change to next tab.
    vim.keymap.set('n', '[t', '<cmd>tabprevious<cr>', { desc = 'Change to previous [t]ab.' }),

    ---------------------Keymap For Gitsigns-----------------------------

    vim.keymap.set('n', '[g', '<cmd>Gitsigns prev_hunk<cr>', { desc = "Go to previous [G]it Hunk." }),
    vim.keymap.set('n', ']g', '<cmd>Gitsigns next_hunk<cr>', { desc = "Go to next [G]it Hunk." }),

    ---------------------Keymap For Neo Tree-----------------------------

    vim.keymap.set('n', '<leader>ot', '<cmd>Neotree focus filesystem left toggle reveal_force_cwd<cr>',
      { desc = '[O]pen [T]ree Filesystem' }),
    vim.keymap.set('n', '<leader>of', '<cmd>Neotree focus filesystem float toggle<cr>',
      { desc = '[O]pen [F]loat Filesystem' }),
    vim.keymap.set('n', '<leader>og', '<cmd>Neotree show git_status right toggle<cr>',
      { desc = '[O]pen [G]it Status' }),
  },

  ---------------------Nvim-telescope-fzf-native install Windows ----------

  --{
  --'nvim-telescope/telescope-fzf-native.nvim',
  --build =
  --'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  --},

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

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

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
        window = {
          position = "left",
          width = 30,
          mappings = {
            ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
            ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
            ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
          },
        },
      }
    end,
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
              desc = ' Nvim Plugins',
              group = 'Files',
              action = ':e ~/.config/nvim/lua/custom/plugins/init.lua',
              key = 'a',
            },
            {
              desc = ' Setting',
              group = 'Setting',
              action = ':e $MYVIMRC | :cd %:p:h',
              key = 'd',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

  ----------------------Colorizer.lua--------------------------------------

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup {
        css = {
          css_fn = true,
          css = true,
          names = true,
        },
        'javascript',
        'html',
        'markdown',
        'python',
        'vue'
      }
    end
  },

  ----------------------Carbon-Now(code-captureViaUrl)--------------------------------------

  {
    "ellisonleao/carbon-now.nvim",
    opts = {
      -- Browser
      open_cmd = "google-chrome",
      options = {
        theme = "Night Owl"
      }
    },
    cmd = "CarbonNow"
  },

  ----------------------Mason-Null.ls--------------------------------------

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = require("null-ls").builtins.formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      -- local diagnostics = require("null-ls").builtins.diagnostics

      require("mason").setup()
      require("mason-null-ls").setup({
        ensure_installed = {
          "eslint_d",
          "prettier",
          "prettierd",
          "stylua"
        },
        automatic_installation = false,
        handlers = {
        }
      })
      require("null-ls").setup({
        sources = {
          formatting.prettierd.with {
            -- Filetypes for use prettier formatting.
            filetypes = { "html", "json", "yaml", "markdown", "vue" },
            -- Arg for formatting
            extra_args = { "--no-semi", "--jsx-single-quote" },
          },
          formatting.stylua.with {
            filetypes = { "lua" }

          }
        }
      })
    end,
  }
}
