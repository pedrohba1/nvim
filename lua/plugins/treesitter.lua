return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local extra_langs = {
        "rust",
        "markdown",
        "markdown_inline",
        "svelte",
        "typescript",
        "javascript",
        "css",
        "html",
        "json",
        "lua",
        "vim",
        "vimdoc",
        "query",
      }

      opts.ensure_installed = opts.ensure_installed or {}

      for _, lang in ipairs(extra_langs) do
        if not vim.tbl_contains(opts.ensure_installed, lang) then
          table.insert(opts.ensure_installed, lang)
        end
      end

      opts.auto_install = true
    end,
  },
}
