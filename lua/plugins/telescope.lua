return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8', -- Versão estável do Telescope
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons' -- Ícones para os arquivos na busca
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      -- Configuração básica do comportamento da janela
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/", "target/" }, -- Ignora pastas pesadas do Angular e Spring Boot
          path_display = { "truncate" },
        }
      })

      -- Atalhos de teclado (Keymaps)
      -- Pressione Espaço + a letra indicada abaixo
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Buscar Arquivos' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Buscar Texto Dentro dos Arquivos' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'Listar Abas/Arquivos Abertos' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Buscar na Ajuda do Neovim' })
    end
  }
}
