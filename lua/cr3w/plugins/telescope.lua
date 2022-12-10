-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
  },
})

require("telescope").setup({
  extensions = {
      ["zf-native"] = {
          -- options for sorting file-like items
          file = {
              -- override default telescope file sorter
              enable = true,
              hidden = true,
              -- highlight matching text in results
              highlight_results = true,

              -- enable zf filename match priority
              match_filename = true,
          },

          -- options for sorting all other items
          generic = {
              -- override default telescope generic item sorter
              enable = true,

              -- highlight matching text in results
              highlight_results = true,

              -- disable zf filename match priority
              match_filename = false,
          },
      }
  },
})

require("telescope").load_extension("zf-native")
