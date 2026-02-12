return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false,
      ensure_installed = { "ts_ls", "eslint" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
      },

      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
}
