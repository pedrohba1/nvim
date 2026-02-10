return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<C-\>]],
      shade_terminals = true,
      direction = "float",

      -- set up double-ESC per terminal
      on_open = function(term)
        local esc = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)
        vim.keymap.set("t", "<Esc><Esc>", function()
          vim.api.nvim_feedkeys(esc, "n", false)
        end, { buffer = term.bufnr, noremap = true, silent = true })
      end,
    },

    -- we’ll configure mappings in `config` so they’re always real Neovim maps
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- normal ToggleTerm mappings
      vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal", silent = true })
      vim.keymap.set(
        "n",
        "<leader>tn",
        "<cmd>ToggleTerm direction=horizontal<cr>",
        { desc = "Terminal horizontal", silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>tv",
        "<cmd>ToggleTerm direction=vertical<cr>",
        { desc = "Terminal vertical", silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>tf",
        "<cmd>ToggleTerm direction=float<cr>",
        { desc = "Terminal float", silent = true }
      )

      -- 4 terminals in a new tab (only terminals in that tab)
      vim.keymap.set("n", "<leader>t4", function()
        vim.cmd("tabnew")

        -- open 4 horizontal terminals with ids 1..4
        for i = 1, 4 do
          vim.cmd(i .. "ToggleTerm direction=horizontal")
        end

        -- close any non-toggleterm window in this tab
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype ~= "toggleterm" then
            vim.api.nvim_win_close(win, false)
          end
        end

        -- optional: make splits equal
        vim.cmd("wincmd =")
      end, { desc = "4 terminals in new tab", silent = true })

      -- 2 terminals in a new tab (only terminals in that tab)
      vim.keymap.set("n", "<leader>t2", function()
        vim.cmd("tabnew")

        -- open 2 vertical terminals with ids 1 and 2
        for i = 1, 2 do
          vim.cmd(i .. "ToggleTerm direction=vertical")
        end

        -- close any non-toggleterm window in this tab
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype ~= "toggleterm" then
            vim.api.nvim_win_close(win, false)
          end
        end

        -- optional: make splits equal
        vim.cmd("wincmd =")
      end, { desc = "2 terminals in new tab", silent = true })
    end,
  },
}
