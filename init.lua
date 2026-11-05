
-- Definir espaço (Leader Key)
vim.g.mapleader = " "

-- Opções básicas
vim.opt.number = true          -- Mostra número da linha
vim.opt.relativenumber = true  -- Números relativos
vim.opt.mouse = 'a'            -- Habilita suporte ao mouse
vim.opt.expandtab = true       -- Usa espaços em vez de tab
vim.opt.shiftwidth = 4         -- Tamanho da indentação
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus" -- Usa a área de transferência do Windows (Ctrl+C / Ctrl+V)
vim.opt.termguicolors = true   -- Cores verdadeiras no terminal

require("config.lazy")
