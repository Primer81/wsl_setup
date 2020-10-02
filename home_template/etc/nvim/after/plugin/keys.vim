" scrolling with [ and ]
" one line incr
nnoremap <silent><nowait> <c-j> <c-e>
nnoremap <silent><nowait> <c-k> <c-y>

"nnoremap <silent><nowait> [ [[
"nnoremap <silent><nowait> ] ]]
"
"function! MakeBracketMaps()
"    nnoremap <silent><nowait><buffer> [ <c-e>
"    nnoremap <silent><nowait><buffer> ] <c-y>
"endfunction
"
"augroup bracketmaps
"    autocmd!
"    autocmd FileType * call MakeBracketMaps()
"augroup END

" 1/2 screen incr
"nnoremap <silent><nowait> \[ <c-d>
"nnoremap <silent><nowait> \] <c-u>
nnoremap <silent><nowait> <s-j> <c-d>
nnoremap <silent><nowait> <s-k> <c-u>

" refactor
nnoremap <F6> :%s/<C-r><C-w>/

" copy paste between vim instances (only works in visual mode)
vmap <silent> <nowait> ,y "xy<CR>:wviminfo! ~/.viminfou
nmap <silent> <nowait> ,p :rviminfo! ~/.viminfo<CR>"xp]]]"
