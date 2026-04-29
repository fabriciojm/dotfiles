" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
" " Yank to system clipboard
set clipboard=unnamed
" Go to previous/next markdown header
nnoremap <silent> ]] :ObsidianBacklinks<CR>zt:call search('^##*\\s', 'W')<CR>
nnoremap <silent> [[ :ObsidianBacklinks<CR>zt:call search('^##*\\s', 'Wb')<CR>
