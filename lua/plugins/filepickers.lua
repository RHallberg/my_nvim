return {
  {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<C-l>"] = "actions.select",
        ["<C-k>"] = { "actions.select", opts = { vertical = true } },
        ["<C-j>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-n>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-r>"] = "actions.refresh",
        ["<C-h>"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["."] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["H"] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
      }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  }
}
