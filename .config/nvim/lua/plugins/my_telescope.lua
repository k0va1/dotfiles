local actions = require("telescope.actions")

require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-Down>"] = require('telescope.actions').cycle_history_next,
        ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
      },
    },
    layout_config = { prompt_position = "top", height = 0.5 }
  },
  extensions = {
    recent_files = {
      only_cwd = true
    },
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    }
  }
}

require("telescope").load_extension("file_browser")
require("telescope").load_extension("recent_files")
