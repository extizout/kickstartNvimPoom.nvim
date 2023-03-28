-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'bluz71/vim-nightfly-colors',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'nightfly'
    end,
  },

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'nightfly',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

    'tpope/vim-surround'

}
