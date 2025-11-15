return {

  {
    "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate",
    opts = {
      ensure_installed = { "vimdoc", "javascript", "typescript", "ruby",  "lua", "awk",
      "html", "tsx", "vim", "yaml", "json", "graphql", "go", "embedded_template"},

    },
  },

}

