return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      ensure_installed = { "c", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "lua" },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
