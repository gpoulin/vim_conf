set nocompatible

filetype indent plugin on

syntax on

let mapleader = "é"

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 4 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
"
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
" map Y y$
"
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
"
"
"------------------------------------------------------------
" vim-latex compatibility
"
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


"maximum line length
set colorcolumn=80


"Remove TrailingWhiteSpaces
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
nmap <C-l> :call StripTrailingWhitespaces()<CR>

if has("gui_running")
    colorscheme blackboard
else
    colorscheme elflord
endif


"indentation with < and >
vnoremap < <gv
vnoremap > >gv

"wrap line with Q
vmap Q gq
nmap Q gqap

"autocomplete on ctrl-space
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
  if has("unix")
    inoremap <Nul> <C-n>
  else
  " I have no idea of the name of Ctrl-Space elsewhere
  endif
endif

"let g:pathogen_disabled =[]
"call add(g:pathogen_disabled, 'vim-phpqa')

if has("gui_running")
    python from powerline.vim import setup as powerline_setup
    python powerline_setup()
    python del powerline_setup
    set guifont=Liberation\ Mono\ for\ Powerline\ 10
endif

" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
map <C-n> :NERDTreeToggle<CR>
