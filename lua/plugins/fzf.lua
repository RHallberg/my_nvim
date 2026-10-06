return {
  'junegunn/fzf',
  { 'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      fzf_opts = {
        ["--gutter"] = " ",
        ["--pointer"] = "",
        ["--cycle"] = true,
        ["--info"] = "hidden",
        ["--no-scrollbar"] = true,
      },
      fzf_colors = true,
    },
  }
}
