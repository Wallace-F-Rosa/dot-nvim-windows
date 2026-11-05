-- Força o caminho correto de dados no Windows (%LOCALAPPDATA%\nvim-data)
local data_path = vim.fn.stdpath("data")
local lazypath = data_path .. "/lazy/lazy.nvim"

-- Garante a criação da pasta de dados se ela não existir
if vim.fn.isdirectory(data_path) == 0 then
  vim.fn.mkdir(data_path, "p")
end

-- Se o lazy.nvim não estiver na máquina, clona direto do GitHub
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Erro ao clonar o lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPressione qualquer tecla para sair..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Adiciona o caminho do Lazy ao runtime do Neovim
vim.opt.rtp:prepend(lazypath)


-- Inicializa o lazy com a pasta de plugins
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
  },
})
