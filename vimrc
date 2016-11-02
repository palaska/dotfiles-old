set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/Vundle.vim'
"
" list all plugins that you'd like to install here
"Plugin 'kien/ctrlp.vim' " fuzzy find files
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'zirrostig/vim-schlepp'
Plugin 'chriskempson/base16-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'briancollins/vim-jst'
Plugin 'adimit/prolog.vim'
Plugin 'tmhedberg/matchit'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mxw/vim-jsx'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

call vundle#end()
filetype plugin indent on
" Vundle plugins
set number        " Show line numbers
syntax enable     " Use syntax highlighting
colorscheme base16-ocean
set background=dark
set shell=/bin/sh
set encoding=utf8

" gui fonts
  if has('gui_running')
  set guifont=SauceCodePowerline-Light:h12
endif

"au FileType javascript call JavaScriptFold()

"set folder glyphs on
"let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Airline visible in single file
set laststatus=2
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" syntastic lint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <Leader>l :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" es6 linter
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_enable_javascript_checker = 1
"let g:syntastic_javascript_eslint_exec = '/usr/local/bin/eslint'

" jsx highlighting in js files
let g:jsx_ext_required = 0

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Leader Mappings
let mapleader = "\<Space>"
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>x :lclose<CR>:bdelete<CR>

set hlsearch
map <Leader>n :nohl<CR>

" Toggle nerdtree
map <Leader>, :NERDTreeToggle<CR>

" vim pane resizing
map ¬ <C-W>>
map ˙ <C-W><
map ˚ <C-W>+
map ∆ <C-W>-

autocmd FileType javascript noremap <buffer> <C-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <C-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <C-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <C-f> :call CSSBeautify()<cr>

set noswapfile

" change cursor on insert mode
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"

" Reduce timeout after <ESC> is recvd. This is only a good idea on fast links.
set ttimeout
set ttimeoutlen=20
set notimeout

" swap block mode with visual
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" dragvisuals vim-schlepp keys
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight
vmap <unique> D       <Plug>SchleppDup

" copy with yank to outside vim
set clipboard=unnamed

"key to insert mode with paste using F2 key
map <C-v> :set paste<CR>i
" Leave paste mode on exit
au InsertLeave * set nopaste

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

"Display extra whitespace
set list listchars=tab:»·,trail:·

" disable auto-commenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
