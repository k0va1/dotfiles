-- begin | remove trailing whitespaces on save
local remove_trailing_whitespaces = function()
  local current_window_state = vim.fn.winsaveview()
  vim.api.nvim_command("keeppatterns  %s/\\s\\+$//e")
  vim.fn.winrestview(current_window_state)
end
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = remove_trailing_whitespaces,
})
-- end | remove trailing whitespaces on save

-- begin | autoindent files on save
local autoindent_on_save = function()
  local filetypes_blacklist = { '', 'dockerfile', 'yaml', 'markdown', 'conf', 'tads', 'dot', 'vim', 'gitignore' }
  local filenames_blacklist = { 'structure.sql' }

  local current_fileytype = vim.bo.filetype
  local current_filename  = vim.fn.expand('%:t')

  for _,v in pairs(filetypes_blacklist) do
    if v == current_fileytype then return end
  end

  for _,v in pairs(filenames_blacklist) do
    if v == current_filename then return end
  end

  vim.cmd(vim.api.nvim_replace_termcodes('normal migg=G`i', true, true, true))
end
--[[vim.api.nvim_create_autocmd({"BufWritePre"},{]]
--[[pattern = {"*"},]]
--[[callback = autoindent_on_save]]
--[[})]]
-- end | autoindent files on save
