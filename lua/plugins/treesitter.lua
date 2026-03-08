return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = nil,
    opts = function()
      return {
        ensure_installed = { "rust", "markdown", "markdown_inline", "svelte", "typescript", "javascript", "css", "html" },
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        ignore_install = { "jsonc" },
      }
    end,
  },
}
