
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      -- Abre/fecha a interface gráfica automaticamente ao iniciar/parar o debug
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

      -- ATALHOS DE TECLADO (Keymaps)
      -- F5: Iniciar / Continuar
      vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Debug: Iniciar/Continuar" })
      -- F10: Passo por cima (Step Over)
      vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Debug: Step Over" })
      -- F11: Entrar no método (Step Into)
      vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Debug: Step Into" })
      -- F12: Sair do método (Step Out)
      vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "Debug: Step Out" })
      -- Espaço + b: Alternar Breakpoint (Ponto de parada)
      vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
      -- Espaço + ui: Alternar janelas de debug manualmente
      vim.keymap.set("n", "<leader>ui", function() dapui.toggle() end, { desc = "Debug: Toggle UI" })

      -- =========================================================================
      -- 1. CONFIGURAÇÃO PARA ANGULAR (Google Chrome / Edge)
      -- =========================================================================
      dap.adapters["pwa-chrome"] = {
        type = "asset",
        command = "node",
        args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js" },
      }

      dap.configurations.typescript = {
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Launch Chrome against localhost (Angular)",
          url = "http://localhost:4200", -- Porta padrão do ng serve
          webRoot = "${workspaceFolder}",
          sourceMaps = true,
          userDataDir = false,
        }
      }
      -- Copia a configuração para arquivos JavaScript também
      dap.configurations.javascript = dap.configurations.typescript

      -- =========================================================================
      -- 2. CONFIGURAÇÃO PARA SPRING BOOT (Java)
      -- =========================================================================
      -- O jdtls (instalado via Mason) injeta o adapter de Java automaticamente.
      -- Só precisamos mapear a configuração padrão do Spring Boot:
      dap.configurations.java = {
        {
          type = "java",
          request = "launch",
          name = "Spring Boot: Launch Application",
          mainClass = "${file}", -- Executa a classe principal aberta na sua aba
          projectName = "${workspaceFolder}",
        }
      }
    end
  }
}
