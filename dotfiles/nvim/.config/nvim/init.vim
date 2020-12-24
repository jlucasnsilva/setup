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
set tabstop=4 softtabstop=4
set nowrap
set scrolloff=10
set clipboard+=unnamedplus

call plug#begin(stdpath('data') . '/plugged')
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'pangloss/vim-javascript'
	Plug 'mxw/vim-jsx'
	Plug 'w0rp/ale'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-rsi'
	Plug 'olivertaylor/vacme'
call plug#end()

colorscheme vacme

" ---------------------------------------------------------
" ALE
"
"   Configurações para a ferramenta de 'linting' ALE
" ---------------------------------------------------------

let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '●'

" ---------------------------------------------------------
" Go
"
"   Configurações para a linguagem de programação go.
" ---------------------------------------------------------

" Executa :GoBuild :GoTestCompile dependendo do nome
" do arquivo
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR
autocmd FileType go nmap <leader>r <Plug>(go-run)

" todos erros são exibidos em listas quickfix
let g:go_list_type = "quickfix"
" usa goimports ao invés de gofmt
let g:go_fmt_command = "goimports"

" ---------------------------------------------------------
" JavaScript
"
"   Configurações para a linguagem de programação
"   javascript.
" ---------------------------------------------------------

let g:javascript_plugin_jsdoc = 1

