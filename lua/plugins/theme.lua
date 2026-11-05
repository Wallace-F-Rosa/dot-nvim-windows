return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- Carrega o tema imediatamente ao iniciar
    priority = 1000, -- Garante que o tema carregue antes de qualquer outro plugin
    config = function()
      -- Customizações opcionais do tema podem vir aqui antes do colorscheme
      require("tokyonight").setup({
        style = "night", -- Opções: storm, night, moon, day
        transparent = false, -- Mude para true se quiser usar o fundo do seu terminal
      })

      -- Ativa o tema no Neovim
      vim.cmd([[colorscheme tokyonight]])

      -- =========================================================================
      -- CUSTOMIZAÇÃO VISUAL DO DEBUGGER (DAP SIGNS)
      -- =========================================================================
      -- Define as cores dos ícones baseadas no tema
      vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#f7768e', bg = nil })     -- Vermelho Tokyo
      vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = '#545c7e', bg = nil }) -- Cinza Escuro
      vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#7aa2f7', bg = nil })       -- Azul Tokyo
      vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#9ece6a', bg = nil })        -- Verde Tokyo (Linha atual)

      -- Define os ícones que aparecerão na barra lateral (Sign Column)
      local dap_icons = {
        DapBreakpoint = { text = "🔴", texthl = "DapBreakpoint", linehl = "", numhl = "" },
        DapBreakpointCondition = { text = "🔶", texthl = "DapBreakpoint", linehl = "", numhl = "" },
        DapBreakpointRejected = { text = "🚫", texthl = "DapBreakpointRejected", linehl = "", numhl = "" },
        DapLogPoint = { text = "📝", texthl = "DapLogPoint", linehl = "", numhl = "" },
        DapStopped = { text = "▶️", texthl = "DapStopped", linehl = "DiagnosticUnderlineInfo", numhl = "DapStopped" },
      }

      for name, sign in pairs(dap_icons) do
        vim.fn.sign_define(name, sign)
      end
    end,
 }
 -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
 --
 --
}
