"enable type file detection
filetype on

"enable plugins and load plugin for the detected file type
filetype plugin on

"load an ident file for the detected file type
filetype indent on

syntax on
set number
set cursorline
set cursorcolumn
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set smartindent
"keep the thick cursor
set guicursor

set background=dark
colorscheme jellybeans


"column with errors
set signcolumn=yes

"do not save backup files
set nobackup

"do not let cursor scroll below or above N number of lines when scrolling
set scrolloff=10

"do not wrap lines
set nowrap

"while searching through a file incrementanlly highlit matching characters as you type
set incsearch

"show partial command you type in the last line of the screen
set showcmd

"show the mod you are on the last line
set showmode

"show matching words during a search.
set showmatch

"use highlighting when doing a search.
set hlsearch

"set the commands to save in history default number is 20.
set history=1000
    
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

noremap <Leader>\t :below terminal<CR>

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \	if &omnifunc == "" |
              \		setlocal omnifunc=syntaxcomplete#Complete |
              \	endif
endif

" use 256 colors when possible
if has('gui_running') || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || (&term =~? 'mlterm\|fbterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme jellybeans
    "colorscheme desert     "moche
else
    colorscheme delek       "tres moche
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'  
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Config to support C#
Plug 'OmniSharp/omnisharp-vim'
Plug 'Valloric/YouCompleteMe'


call plug#end()


