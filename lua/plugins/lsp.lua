return {
  -- Gerenciador de Servidores LSP, Linters e Formatters
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      
      -- Servidores necessários para Angular e Spring Boot (Java)
      local servers = {
        "angularls", -- Suporte a Angular (Templates e TypeScript)
        "ts_ls",      -- TypeScript/JavaScript
        "html",       -- Templates HTML
        "cssls",      -- Estilização CSS/SCSS
        "jdtls",      -- Eclipse JDTLS (Java / Spring Boot)
      }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
      })

      -- Sintaxe Moderna do Neovim para ativar os servidores (Evita o require antigo)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      for _, server in ipairs(servers) do
        -- Nova API nativa estável do Neovim para carregar as configurações do LSP
        if vim.lsp.config then
          vim.lsp.config(server, {
            capabilities = capabilities,
          })
        else
          -- Fallback seguro caso utilize alguma versão intermediária
          local ok, lspconfig = pcall(require, "lspconfig")
          if ok then lspconfig[server].setup({ capabilities = capabilities }) end
        end
      end
    end,
  },

  -- Motor de Autocompletar (IntelliSense)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item() else fallback() end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim-lspconfig" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
