require('../my_reload')

-- Save file with
vim.api.nvim_set_keymap('n', '<Leader>w', ":w!<CR>", { noremap = true, silent = true });

-- Save file with sudo
vim.api.nvim_set_keymap('n', '<Leader>W', ":lua require'utils'.sudo_write()<CR>", { noremap = true, silent = true });

vim.api.nvim_set_keymap('n', '<Leader><CR>', ":noh<CR>", { noremap = true, silent = true });

-- Smart way to move between windows
vim.api.nvim_set_keymap('n', '<C-j>', "<C-W>j", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-k>', "<C-W>k", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-h>', "<C-W>h", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-l>', "<C-W>l", { noremap = true, silent = true });

-- Toggle and untoggle spell checking
vim.api.nvim_set_keymap('n', '<Leader>ss', ":setlocal spell!", { noremap = true, silent = true });

--" Bash like keys for the command line
vim.api.nvim_set_keymap('c', '<C-a>', "<Home>", { noremap = true}); -- Goto beginning of line
vim.api.nvim_set_keymap('c', '<C-e>', "<End>", { noremap = true}); -- Goto end of line
vim.api.nvim_set_keymap('c', '<C-k>', [[<C-\>e(" ".getcmdline())[:getcmdpos()-1][1:]<Cr>"]], { noremap = true}); -- Kill to end of line
vim.api.nvim_set_keymap('c', '<C-b>', "<Left>", { noremap = true}); -- Goto char backward
vim.api.nvim_set_keymap('c', '<C-f>', "<Right>", { noremap = true}); -- Goto char forward
vim.api.nvim_set_keymap('c', '<C-d>', "<Delete>", { noremap = true}); -- Kill char forward
vim.api.nvim_set_keymap('c', '<M-b>', [[<C-\>euser#fn#cmdlineMoveWord(-1, 0)<Cr>]], { noremap = true}); -- Goto word backward
vim.api.nvim_set_keymap('c', '<M-f>', [[<C-\>euser#fn#cmdlineMoveWord( 1, 0)<Cr>]], { noremap = true}); -- Goto word forward
vim.api.nvim_set_keymap('c', '<M-d>', [[<C-\>euser#fn#cmdlineMoveWord( 1, 1)<Cr>]], { noremap = true}); -- Kill word forward
vim.api.nvim_set_keymap('c', '<M-Backspace>', [[<C-\>euser#fn#cmdlineMoveWord(-1, 1)<Cr>]], { noremap = true}); -- Kill word backward
vim.api.nvim_set_keymap('c', '<C-p>', "<Up>", { noremap = true});
vim.api.nvim_set_keymap('c', '<C-n>', "<Down>", { noremap = true});

-- Telescope
vim.api.nvim_set_keymap('n', '<C-f>', ":Telescope find_files<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<Leader>g', ":Telescope live_grep<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<Leader>fh', ":Telescope help_tags<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap("n", "<leader>f", [[:lua require('telescope').extensions.recent_files.pick()<CR>]], {noremap = true, silent = true})
local utils = require('my_utils')
local keymap = vim.keymap.set
local tb = require('telescope.builtin')
keymap('v', 'gv',
function()
  local text = utils.get_visual_selection()
  tb.live_grep({ default_text = text })
end, { noremap = true, silent = true });

vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope file_browser<CR>", { noremap = true })

-- Buffers
vim.api.nvim_set_keymap('n', '<Leader>n', ":bnext<cr>", { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<Leader>p', ":bprevious<cr>", { noremap = true, silent = true });

-- GoTo code navigation
vim.api.nvim_set_keymap("n", "gd", "go to definition", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gy", "go to type definition", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gi", "go to implementation", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gr", "go to reference", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gs", "split horizontal", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gv", "split vertical", {noremap = true, silent = true})

-- Tests
vim.api.nvim_set_keymap("n", "<Leader>t", ":TestNearest<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>tt", ":TestLast<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>tf", ":TestFile<CR>", {noremap = true, silent = true})

-- Neogit
vim.api.nvim_set_keymap("n", "<Leader>v", ":Neogit<CR>", {noremap = true, silent = true})

-- nvim-tree
vim.api.nvim_set_keymap("n", "<Leader>nn", ":NvimTreeFindFileToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>nf", ":NvimTreeFindFile<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>q", ":qa<CR>", {noremap = true, silent = true})

-- reload config
vim.api.nvim_set_keymap("n", "<leader><bslash>", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = false }) -- move line down(n)
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = false }) -- move line up(n)
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = false }) -- move line up(v)
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = false }) -- move line down(v)

keymap("n", "<Leader>mt",
function()
  utils.toggle_markdown_checkbox()
end, { noremap = true, silent = true });
