-- Next file in argv
vim.keymap.set('n', '<C-B>', ':previous <CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-N>', ':next <CR>', { noremap = true, silent = true})

-- Move line up/down
vim.keymap.set('n', '<A-Up>', ':m -2 <CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<A-Down>', ':m +1 <CR>', { noremap = true, silent = true})

-- prev/next buffer
vim.keymap.set('n', '<C-,>', 'gT', { noremap = true, silent = true})
vim.keymap.set('n', '<C-.>', 'gt', { noremap = true, silent = true})

-- quit nvim
vim.keymap.set('n', '<C-A-q>', ':qall <CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-q>', ':q <CR>', { noremap = true, silent = true})

-- prev/next window / tab
vim.keymap.set('n', '<A-Tab>', '<C-w>w', { noremap = true, silent = true})
vim.keymap.set('n', '<A-S-Tab>', '<C-w><S-w>', { noremap = true, silent = true})

-- resize current tab window / tab
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
