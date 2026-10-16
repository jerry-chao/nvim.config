-- Theme spec for LazyVim.
--
-- On Omarchy (Linux), the active theme is generated under the Omarchy state
-- directory and symlinked here. On other systems (macOS, including Apple
-- Silicon) there is no Omarchy theme file, so fall back to a built-in
-- colorscheme so Neovim still starts with a consistent theme.
local omarchy_theme = vim.fn.stdpath("state") .. "/omarchy/current/theme/neovim.lua"
-- Omarchy's .local/state lives under the home directory, not XDG_STATE_HOME.
if vim.fn.filereadable(omarchy_theme) ~= 1 then
  omarchy_theme = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")
end

if vim.fn.filereadable(omarchy_theme) == 1 then
  local ok, theme = pcall(dofile, omarchy_theme)
  if ok and type(theme) == "table" then
    return theme
  end
end

-- Allow an explicit override from the environment, e.g. NVIM_THEME=tokyonight.
local colorscheme = os.getenv("NVIM_THEME")
if not colorscheme or colorscheme == "" then
  colorscheme = "tokyonight"
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme,
    },
  },
}
