return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
    lazy = false,
    opts = {
      flavour = "macchiato",
      transparent_background = true
    }
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin"
    }
  }
}
