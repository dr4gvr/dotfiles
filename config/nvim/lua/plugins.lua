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
  
}

