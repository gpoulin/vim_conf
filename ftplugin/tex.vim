" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

"spelling
set spell spelllang=en_us
setlocal spell spelllang=en_us

let $PYTHONPATH = "/home/guillaume/.vim/bundle/vim-latex-vim-latex/ftplugin/latex-suite/"

let g:Tex_CompileRule_pdf = 'pdflatex --synctex=1 --interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats="pdf"
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRuleiComplete_pdf = '/home/guillaume/bin/evince_vim_dbus.py EVINCE $*.pdf 45 $*.tex'
let g:Tex_ViewRule_format = 'pdf'
let g:Tex_Com_para="\\ParallelLText{<++>}\\ParallelRText{<++>}\\ParallelPar<++>"
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
