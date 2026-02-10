return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "mrcjkb/rustaceanvim", -- Add rustaceanvim as a dependency
  },
  opts = function(_, opts)
    opts.adapters = opts.adapters or {}
    table.insert(opts.adapters, require("rustaceanvim.neotest"))
  end,
  config = function(_, opts)
    require("neotest").setup(opts)

    -- Set up keybindings
    local map = vim.keymap.set
    local neotest = require("neotest")

    map("n", "<leader>tt", neotest.run.run, { desc = "Run nearest test" })
    map("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run file tests" })
    map("n", "<leader>td", function()
      neotest.run.run({ strategy = "dap" })
    end, { desc = "Debug nearest test" })
    map("n", "<leader>ts", neotest.summary.toggle, { desc = "Toggle test summary" })
    map("n", "<leader>to", neotest.output.open, { desc = "Open test output" })
  end,
}
