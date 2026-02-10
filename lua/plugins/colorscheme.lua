return {
  -- Add gruvbox-material
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- Ensure it loads immediately
    priority = 1000, -- High priority so it loads before other plugins
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_ui_contrast = "low"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_enable_italic = 0
      vim.g.gruvbox_material_disable_italic_comment = 1
      vim.g.gruvbox_material_cursor = "red"
      vim.g.gruvbox_material_disable_terminal_colors = 1

      -- Set colorscheme after configuring the options
      vim.cmd("colorscheme gruvbox-material")
    end,
  },

  -- Configure LazyVim to use gruvbox-material
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
