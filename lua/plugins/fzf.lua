return {
  'junegunn/fzf',
  { 'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      winopts = {
        border = "single",
        preview = {
          border = "single",
          title = true,
          title_pos = "left",
        },
      },
      fzf_opts = {
        ["--gutter"] = " ",
        ["--pointer"] = "▶",
        ["--cycle"] = true,
        ["--info"] = "hidden",
        ["--border"] = "none",
        ["--no-scrollbar"] = true,
      },
      fzf_colors = true,
    },
  }
}
