return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
  { "nvim-mini/mini.pairs", opts = {} },
}

