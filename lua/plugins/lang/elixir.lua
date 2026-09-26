-- Elixir LSP via Expert (https://expert-lsp.org/docs/editors/)
-- nvim-lspconfig 自带 expert 定义（lsp/expert.lua），此处只需 enable。
-- 二进制由 Mason 安装（ensure_installed -> :MasonInstall expert）。
--
-- 2026-09-18: mason 的 stable v0.1.10 在本机 msync-prototype 上起不来 project node
-- （XPForge.EPMD undef -> start_timeout，见 .expert/expert.log），临时切 nightly 验证。
-- nightly 若转正：删掉下面这行 vim.lsp.config（回退到 mason stable）；若 nightly 也不行：
-- 考虑换回 lexical/elixir-ls。nightly 二进制：~/.local/bin/expert-nightly。
vim.lsp.config("expert", {
  cmd = { vim.fn.expand("~/.local/bin/expert-nightly"), "--stdio" },
})
vim.lsp.enable("expert")

return {
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "expert",
      },
    },
    opts_extend = { "ensure_installed" },
  },
}
