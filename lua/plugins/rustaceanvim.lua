-- ~/.config/nvim/lua/plugins/rust.lua (or wherever you set rustaceanvim)
return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  lazy = false,
  init = function()
    vim.g.rustaceanvim = {
      -- Tools: enable inline hints
      tools = {
        inlay_hints = { auto = true, only_current_line = false },
      },
      -- Server: enable deep analysis
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              buildScripts = { enable = true },
            },
            procMacro = { enable = true },
            checkOnSave = { command = "clippy" },
            inlayHints = { enable = true },
          },
        },
      },
    }
  end,
}
