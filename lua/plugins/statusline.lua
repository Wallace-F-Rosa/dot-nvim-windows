
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 
      "nvim-tree/nvim-web-devicons" -- Ícones para os arquivos e git
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight", -- Sincroniza as cores automaticamente com o seu tema
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" }, -- Transições elegantes em triângulo
          globalstatus = true, -- Mantém uma única barra mesmo se você dividir a tela ao meio
        },
        sections = {
          -- Lado Esquerdo
          lualine_a = { "mode" }, -- Modo atual (NORMAL, INSERT, VISUAL)
          lualine_b = { 
            { 
              "branch", 
              icon = "", -- Ícone moderno de Branch do Git
            }, 
            "diff", 
            "diagnostics" 
          },
          lualine_c = { 
            { "filename", path = 1 } -- Mostra o nome e a pasta do arquivo aberto
          },
          
          -- Lado Direito
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" }, -- Porcentagem percorrida no arquivo
          lualine_z = {
            -- Relógio customizado com Data e Hora
            {
              "datetime",
              style = "%d/%m/%Y às %H:%M", -- Formato brasileiro (Ex: 04/11/2026 às 21:30)
              icon = "", -- Ícone de relógio da Nerd Font
            }
          },
        },
      })
    end,
  }
}
