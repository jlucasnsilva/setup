" PLUGINS
"   - github.com/scrooloose/nerdtree => file tree
"   - ReplaceWithRegister
"   - switch lines
"   - open lines

" Ensures that various options are properly set to work with the Vim-related
" packages available in Debian.
runtime! debian.vim

" Enables syntax highlighting.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark
set background=light

" Load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

if executable('rg')
    let g:rg_derive_root='true'
endif

" https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen/init.vim
set autoindent
set autowrite
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set nobackup
set noerrorbells
set noswapfile
set number
set relativenumber
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nowrap
set scrolloff=4
set clipboard+=unnamedplus

call plug#begin(stdpath('data') . '/plugged')
    Plug 'jiangmiao/auto-pairs'
    Plug 'w0rp/ale'
    
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
   
    Plug 'jremmen/vim-ripgrep'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'pangloss/vim-javascript'
	Plug 'mxw/vim-jsx'

	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-rsi'

    Plug 'robertmeta/nofrils'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
call plug#end()

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap <Leader>o i<CR><ESC>

nnoremap <c-p> :Files <enter>
nnoremap <Leader>b :Buffers <enter>
nnoremap <Leader>p :Rg 

nnoremap <c-k> ddkP
nnoremap <c-j> ddp

" colorscheme vacme
colorscheme nofrils-acme

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" ---------------------------------------------------------
" ALE
"
"   Configurações para a ferramenta de 'linting' ALE
" ---------------------------------------------------------

let g:ale_fixers = {
\    'javascript': ['eslint', 'prettier'],
\    'c': ['clangtidy', 'clang-format']
\ }

" let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
" let g:ale_sign_error = ' » '

" ---------------------------------------------------------
" C
" ---------------------------------------------------------

autocmd BufRead,BufNewFile *.h set filetype=c

let g:ale_c_clangformat_options = '--style=google'
augroup c99config
    autocmd! c99config
    autocmd FileType c set tabstop=2
    autocmd FileType c set shiftwidth=2
    autocmd FileType c set softtabstop=2
augroup end

" ---------------------------------------------------------
" Markdown
" ---------------------------------------------------------

augroup markdownconfig
    autocmd! markdownconfig
    autocmd FileType markdown set textwidth=80
    autocmd FileType markdown nnoremap <Leader>f gqap
    autocmd BufWritePre *.md :normal gqap<CR>
augroup end

" ---------------------------------------------------------
" Go
"
"   Configurações para a linguagem de programação go.
" ---------------------------------------------------------

" todos erros são exibidos em listas quickfix
let g:go_list_type = "quickfix"
" usa goimports ao invés de gofmt
let g:go_fmt_command = "goimports"
" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

augroup golangbinding
    autocmd! golangbinding
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR
    autocmd FileType go nmap <leader>r <Plug>(go-run)
    autocmd FileType go nnoremap <Leader>T :GoTest<CR>
    
    autocmd FileType go nnoremap <F2> :GoRename<CR>
    autocmd FileType go nnoremap <Leader>f :GoDecls<CR>
    autocmd FileType go nnoremap <Leader>F :GoDeclsDir<CR>
augroup end

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" ---------------------------------------------------------
" JavaScript
"
"   Configurações para a linguagem de programação
"   javascript.
" ---------------------------------------------------------

let g:javascript_plugin_jsdoc = 1

