return {
  "nvim-treesitter/nvim-treesitter",
  build = nil, -- stop :TSUpdate
  opts = function(_, _)
    return {
      ensure_installed = { "rust", "markdown", "markdown_inline", "svelte" },
      auto_install = false, -- don’t try to fetch others like jsonc
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      ignore_install = { "jsonc" }, -- belt-and-suspenders
    }
  end,
}
