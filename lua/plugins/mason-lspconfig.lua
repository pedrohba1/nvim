return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false,
      ensure_installed = {
        "ts_ls",
        "eslint",
        "solidity", -- add this
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
        solidity = {}, -- add this
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
}
