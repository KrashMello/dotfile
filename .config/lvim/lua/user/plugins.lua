lvim.plugins = {
  {
    "folke/todo-comments.nvim",
    event = "bufRead",
    config = function()
      require("todo-comments").setup()
    end
  },
}
