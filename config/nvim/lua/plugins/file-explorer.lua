return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Iconos para los archivos
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30, -- Ancho del panel
        side = "left",
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
          },
        },
      },
      filters = {
        dotfiles = false, -- Mostrar archivos ocultos (cámbialo a true si no quieres verlos)
      },
    })
  end,
}
