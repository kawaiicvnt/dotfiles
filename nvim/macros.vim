"" Next file in argv
map <C-B> :previous <CR>
map <C-N> :next <CR>

"" Move line up/down
map <A-Up>   :m -2 <CR>
map <A-Down> :m +1 <CR>

"" prev/next buffer
:map <C-,> gT
:map <C-.> gt

"" quit nvim
:map <C-A-q> :qall <CR>
:map <C-q>   :q <CR>

"" prev/next window / tab
:map <C-Tab> <C-w><w>
:map <C-S-Tab> <C-w><S-w>

"" yd, yn, yb, y2d -- yank :3
""
"" TODO: Is there a better way to do this?
"" C-/ -- comment out line //
"" C-3 -- comment out line #
"" C-- -- comment out line --
""
""
