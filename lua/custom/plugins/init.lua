-- You can add your own plugins here or in other files in this directory! I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

--- [[ Neo-tree Remove Legacy Command]]
vim.g.neo_tree_remove_legacy_commands = 1

vim.g.python3_host_prog = '/bin/python3'

vim.o.scrolloff = 9

vim.o.relativenumber = true

return {

  ---------------------Personal NeoVim Keymap ---------------------------------

  {
    -- [[ Native Neovim ]]
    -- Map jk to ESC in Insert Mode.
    vim.keymap.set('i', 'jk', '<ESC>', { desc = 'ESC' }),
    -- Map jk to ESC in Command Mode.
    vim.keymap.set('c', 'jk', '<ESC>', { desc = 'ESC' }),
    -- Map ESC to exit terminal mode.
    -- vim.keymap.set('t', '<esc>', '<C-\\><C-n>', { desc = '[E]xit terminal mode' }),
    -- Map jk to exit terminal mode.
    -- vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = '[E]xit terminal mode' }),

    -- Map ]t for Change to next tab.
    vim.keymap.set('n', ']t', '<cmd>tabnext<cr>', { desc = 'Change to next [t]ab.' }),
    -- Map [t for Change to next tab.
    vim.keymap.set('n', '[t', '<cmd>tabprevious<cr>', { desc = 'Change to previous [t]ab.' }),

    ---------------------Keymap For Gitsigns-----------------------------

    vim.keymap.set('n', '[g', '<cmd>Gitsigns prev_hunk<cr>', { desc = 'Go to previous [G]it Hunk.' }),
    vim.keymap.set('n', ']g', '<cmd>Gitsigns next_hunk<cr>', { desc = 'Go to next [G]it Hunk.' }),

    ---------------------Keymap For Neo Tree-----------------------------

    vim.keymap.set('n', '<leader>ot', '<cmd>Neotree focus filesystem left toggle reveal_force_cwd<cr>',
      { desc = '[O]pen [T]ree Filesystem' }),
    vim.keymap.set('n', '<leader>of', '<cmd>Neotree focus filesystem float toggle<cr>',
      { desc = '[O]pen [F]loat Filesystem' }),
    vim.keymap.set('n', '<leader>og', '<cmd>Neotree show git_status right toggle<cr>', { desc = '[O]pen [G]it Status' }),
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
      --- [[ Nightfly Vim.Global]]
      vim.g.nightflyCursorColor = true
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
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = { 'b:toggle_number' },
        lualine_z = {},
      },
    },
  },

  ---------------------Vim-Surround-----------------------------------

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  ---------------------Autopair---------------------------------------

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  ---------------------NEO-TREE---------------------------------------

  {
    'nvim-neo-tree/neo-tree.nvim',
    version = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        -- In FILESYSTEM
        filesystem = {
          follow_current_file = true,
          hijack_netrw_behavior = 'open_current',
          find_by_full_path_words = true,
        },
        window = {
          position = 'left',
          width = 30,
          mappings = {
            ['e'] = function()
              vim.api.nvim_exec('Neotree focus filesystem left', true)
            end,
            ['b'] = function()
              vim.api.nvim_exec('Neotree focus buffers left', true)
            end,
            ['g'] = function()
              vim.api.nvim_exec('Neotree focus git_status left', true)
            end,
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
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },

  ----------------------Colorizer.lua--------------------------------------

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        css = {
          css_fn = true,
          css = true,
          names = true,
        },
        'javascript',
        'html',
        'markdown',
        'python',
        'vue',
      }
    end,
  },

  ----------------------Carbon-Now(code-captureViaUrl)--------------------------------------

  {
    'ellisonleao/carbon-now.nvim',
    opts = {
      -- Browser
      open_cmd = 'google-chrome',
      options = {
        theme = 'Night Owl',
      },
    },
    cmd = 'CarbonNow',
  },

  ----------------------Mason-Null.ls--------------------------------------

  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = require('null-ls').builtins.formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      local diagnostics = require('null-ls').builtins.diagnostics

      local code_action = require('null-ls').builtins.code_actions

      require('mason').setup()
      require('mason-null-ls').setup {
        ensure_installed = {
          'eslint_d',
          'prettier',
          'prettierd',
          'stylua',
        },
        automatic_installation = false,
        handlers = {
          function() end, -- disables automatic setup of all null-ls sources
        },
      }
      require('null-ls').setup {
        sources = {
          -- Code Action
          -- code_action.eslint_d,

          -- Formatter
          formatting.prettierd.with {
            -- Filetypes for use prettier formatting.
            filetypes = { 'html', 'json', 'yaml', 'markdown', 'vue', 'javascript' },
            -- Arg for formatting
            extra_args = { '--no-semi', '--jsx-single-quote' },
          },
          formatting.stylua.with {
            filetypes = { 'lua' },
          },

          -- Diagnostics
        },
      }
    end,
  },

  ----------------------ToggleTerm--------------------------------------

  {

    -- Command
    -- <count>ToggleTerm dir= size= direction=
    -- <count>TermExec cmd="" direction=
    --  TermSelect (open prompt for select terminal)
    --  ToggleTermSetName (name terminal)
    --  ToggleTermToggleAll (Toggle all terminals)

    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        -- Map for toggle terminal (previous opened terminal)
        open_mapping = [[<c-t>]],
        -- Default size of terminal
        size = 5,
        direction = 'horizontal',
        float_opts = {
          border = 'curved',
        },
      }
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new {
        cmd = 'lazygit --use-config-file=$HOME/.config/lazygit/config.yml',
        direction = 'float',
        hidden = true,
        count = 5,
        on_open = function(term)
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
        on_close = function()
          vim.cmd 'startinsert!'
        end,
      }

      local function lazygit_toggle()
        lazygit:toggle()
      end

      vim.keymap.set('n', '<leader>lg', lazygit_toggle, { desc = 'lazygit', noremap = true, silent = true })
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      {
        'luukvbaal/statuscol.nvim',
        config = function()
          local builtin = require 'statuscol.builtin'
          require('statuscol').setup {
            relculright = true,
            segments = {
              { text = { builtin.foldfunc },      click = 'v:lua.ScFa' },
              { text = { '%s' },                  click = 'v:lua.ScSa' },
              { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
            },
          }
        end,
      },
    },
    config = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:>]]
      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
      vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAlkkk

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = require('lspconfig').util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup {
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        }
      end
      require('ufo').setup {
        enable_get_fold_virt_text = true,
        open_fold_hl_timeout = 150,
        close_fold_kinds = { 'imports', 'comment' },
        preview = {
          win_config = {
            border = { '', '─', '', '', '', '─', '', '' },
            winhighlight = 'Normal:Folded',
            winblend = 0,
          },
          mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']',
          },
        },
      }
    end,
  },
  { 'typicode/bg.nvim', lazy = false },
}
