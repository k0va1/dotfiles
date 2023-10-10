local neogit = require('neogit')

neogit.setup {
  disable_insert_on_commit = false,
  integrations = {
    telescope = false,
  },
}
