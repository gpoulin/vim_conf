colorscheme blackboard

"map go to definition
nnoremap <silent><Leader>g <C-w><C-]><C-w>T
map <Leader>b Oextract(\Psy\Shell::debug(get_defined_vars()));  # BREAKPOINT<C-c>:w<CR>


set shiftwidth=4
set softtabstop=4
set expandtab

map <Leader>a :Tabularize /=>/<CR>
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=PSR2"

let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#080B17



" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" the above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Your customised tags go first.
set tags+=~/php.tags,$DOC/php.tags
let parent_dir = expand("%:p:h")."/"
while match(parent_dir,"/",0)>-1 && isdirectory(parent_dir)
  let parent_tag = parent_dir."php.tags"
  if filereadable(parent_tag)
    exe ":set tags+=".parent_tag
  endif
  let parent_dir = substitute(parent_dir,"[^/]*/$","","")
endwhile
let parent_dir = getcwd()."/"
while match(parent_dir,"/",0)>-1 && isdirectory(parent_dir)
  let parent_tag = parent_dir."php.tags"
  if filereadable(parent_tag)
    exe ":set tags+=".parent_tag
  endif
  let parent_dir = substitute(parent_dir,"[^/]*/$","","")
endwhile
unlet parent_dir parent_tag
