-- ~/.config/nvim/lua/plugins/osc52.lua
return {
  "ojroques/nvim-osc52",
  event = "VeryLazy",
  config = function()
    require("osc52").setup({
      max_length = 0,
      silent = true,
      trim = false,
    })

    -- Use OSC52 as the clipboard backend
    local function copy(lines, _)
      require("osc52").copy(table.concat(lines, "\n"))
    end
    local function paste()
      return {vim.split(vim.fn.getreg('"'), "\n"), vim.fn.getregtype('"')}
    end
    vim.g.clipboard = {
      name = "osc52",
      copy = {["+"] = copy, ["*"] = copy},
      paste = {["+"] = paste, ["*"] = paste},
    }

    -- Auto-copy on yank
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        if vim.v.event.operator == "y" and vim.v.event.regname == "" then
          require("osc52").copy_register('"')
        end
      end,
    })
  end,
}

