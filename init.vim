set nocompatible
syntax on
filetype plugin indent on

let g:plug_timeout = 3600

let g:ycm_server_python_interpreter = '/Users/lattwood/.pyenv/versions/neovim2/bin/python'

call plug#begin('~/.local/share/nvim/plugged')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Valloric/YouCompleteMe'
  Plug 'hashivim/vim-terraform'
  Plug 'vim-syntastic/syntastic'
  Plug 'juliosueiras/vim-terraform-completion'
  Plug 'mileszs/ack.vim'
  Plug 'rking/ag.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'nathanaelkane/vim-command-w'
  Plug 'fatih/vim-go'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'myusuf3/numbers.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

let g:ackprg = 'ag --vimgrep'

let g:python_host_prog = '/Users/lattwood/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/lattwood/.pyenv/versions/neovim3/bin/python'

let g:terraform_completion_keys = 1

let mapleader=","
set mouse=a

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" When I want to change thing
nnoremap <leader>ev <C-w><C-v><C-w>l:e $MYVIMRC<cr>

set encoding=utf-8

" Spelling (useful for documentation/commits)
nnoremap <Leader>s :setlocal spell! spell?<cr>
nnoremap <Leader>f :setlocal foldenable! foldenable?<cr>
nnoremap <Leader>qc :cclose <bar> :lclose<cr>

set wildmenu
set wildmode=list:longest,full
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler
set showmode
set laststatus=2
set statusline=%f\ %m%h%r%w\ %y\ %{fugitive#statusline()}%=\ B%3n\ ·\ L%5l/%5L\ ·\ C%7(%c%V%)\ ·\ %4(0x%B%)\ ·\ %P
set incsearch           " Incremental search
set nu
set expandtab
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set ci
set copyindent                  " Preserve vertical alignment when indenting
set autoindent tabstop=4 shiftwidth=4
set colorcolumn=81,111              " Highlight long lines
set hlsearch
set hidden
set title

match ErrorMsg '\%>110v.\+'

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" "fix" regex
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

" "fix" backspace
set backspace=2
set nocompatible

"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
"autocmd FileType ruby set expandtab

"autocmd FileType rust set colorcolumn=99
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Helpers. Trailing space isn't a mistake
nnoremap <leader>a :Ack --ignore-dir=node_modules --ignore-dir=build --ignore-dir=vendor 

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_puppet_puppetlint_quiet_messages = {
            \ "level": "warnings",
            \ "type": "style",
            \ "regex": "80chars" }

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::', '"', "'", 'use ', 'namespace ', '\'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'html': ['<', '"', '</', ' '],
            \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \   'haskell' : ['.', 're!.'],
            \   'terraform': ['re![^ *\t"{=$]\w*']
            \ }

" Ignore node_modules in ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|build|__pycache__|.git|.hg|.svn|.npm)$'

" NERDTree can be a little annoying
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_new_tab = 0

map <F10> :NERDTreeToggle<cr>
imap <F10> :NERDTreeToggle<cr>
vmap <F10> :NERDTreeToggle<cr>

map <S-F10> :NERDTreeMirror<cr>
imap <S-F10> :NERDTreeMirror<cr>
vmap <S-F10> :NERDTreeMirror<cr>

map <F11> :NERDTreeFind<cr>
imap <F11> :NERDTreeFind<cr>
vmap <F11> :NERDTreeFind<cr>

nmap <F8> :TagbarToggle<CR>
imap <F8> :TagbarToggle<CR>
vmap <F8> :TagbarToggle<CR>

nnoremap <F5> :GundoToggle<CR>
inoremap <F5> :GundoToggle<CR>
vnoremap <F5> :GundoToggle<CR>

colorscheme Tomorrow-Night
set noerrorbells
set vb

" Don't autoload/autosave sessions
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set backupdir=$TMPDIR//
set directory=$TMPDIR//

let g:rehash256 = 1

set clipboard=unnamed

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
