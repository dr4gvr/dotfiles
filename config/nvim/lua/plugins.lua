return {
-- Configura el plugin nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup{}  -- Configura el servidor de Python como ejemplo
      -- Puedes configurar otros servidores aquí
    end
  },

  -- Plugin para la barra lateral (Nvim-Tree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Íconos para archivos
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30, -- Ancho de la barra lateral
          side = "left", -- Posición a la izquierda
        },
        filters = {
          dotfiles = false, -- Mostrar archivos ocultos
        },
        git = {
          enable = true, -- Habilitar integración con git
        },
      })

      -- Atajo para abrir/cerrar la barra lateral con <leader>e
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
    end
  },
}
