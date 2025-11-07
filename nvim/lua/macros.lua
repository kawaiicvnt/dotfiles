--[[     Handling nvim-wide     --]]
-- quit nvim
vim.keymap.set('n', '<C-A-q>', ':qall <CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-q>', ':q <CR>', { noremap = true, silent = true})


--[[     Editing     --]]
-- Move line up/down
vim.keymap.set('n', '<A-Up>', ':m -2 <CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<A-Down>', ':m +1 <CR>', { noremap = true, silent = true})
-- save
vim.keymap.set('n', '<C-w><C-s>', ':w<CR>', { noremap = false, silent = true})


--[[     Moving around     --]]
-- argv is kinda irrelevant to the rest of those, but the rest look sth like this:
-- tabs    - one active at a time
-- windows - multiple per tab, provides a view to a buffer. Different windows share buffers globally, unless
-- buffers - this is basically the view of a file. Normally these are not scoped and are somewhat independent to windows. However I use scopes.nvim, so they are scoped to a tab's context. This means that we can somewhat organize them.
-- Next file in argv
vim.keymap.set('n', '<C-S-A-,>', ':prev <CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-S-A-.>', ':next <CR>', { noremap = true, silent = true})
-- prev/next tab
vim.keymap.set('n', '<C-A-,>', ':tabprev <CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-A-.>', ':tabnext <CR>', { noremap = true, silent = true})
-- prev/next window
vim.keymap.set('n', '<C-,>', '<C-w>w', { noremap = true, silent = true})
vim.keymap.set('n', '<C-.>', '<C-w><S-w>', { noremap = true, silent = true})
-- prev/next buffer - remember: we use scope.nvim, so buffers are scoped!
vim.keymap.set('n', '<C-S-,>', ':bprev <CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-S-.>', ':bnext <CR>', { noremap = true, silent = true})


--[[     Modifying looks     --]]
-- resize current window
vim.keymap.set('n', '<C-S-A-Left>',  '3<C-w><lt>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-S-A-Right>', '3<C-w>>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-S-A-Down>',  '10<C-w><lt>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-S-A-Up>',    '10<C-w>>', { noremap = true, silent = true})

-- yd, yn, yb, y2d -- yank :3
--
-- TODO: Is there a better way to do this?
-- C-/ -- comment out line //
-- C-3 -- comment out line #
-- C-- -- comment out line --
--
--
