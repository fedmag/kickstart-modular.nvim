return {
  { 'catppuccin/nvim', lazy = false, name = 'catppuccin', opts = {
    flavour = 'frappe',
  } },
  { 'rose-pine/neovim', name = 'rose-pine' },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },
      -- transparent = true,
      theme = 'dragon',
    },
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').setup {
        on_palette = function(palette)
          palette.black0 = palette.gray1
          palette.gray2 = palette.gray5
        end,
      }
    end,
  }, -- Lazy
  {
    'vague2k/vague.nvim',
  },
  {
    'EdenEast/nightfox.nvim',
    options = {
      styles = {
        functions = 'italic',
        comments = 'italic,bold',
      },
    },
  }, -- lazy
}
