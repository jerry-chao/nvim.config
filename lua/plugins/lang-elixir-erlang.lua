local expert = vim.fn.expand("~/.local/bin/expert-nightly")
local erlang_ls = vim.fn.expand("~/.local/bin/erlang_ls")

return {
  { import = "lazyvim.plugins.extras.lang.elixir" },
  { import = "lazyvim.plugins.extras.lang.erlang" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = { enabled = false },
        expert = {
          mason = false,
          cmd = { expert, "--stdio" },
        },
        erlangls = {
          mason = false,
          cmd = { erlang_ls },
        },
      },
    },
  },
}
