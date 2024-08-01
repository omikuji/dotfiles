set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'chr4/nginx.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'w0rp/ale'
Plugin 'maximbaz/lightline-ale'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'posva/vim-vue'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prettier/vim-prettier'
Plugin 'github/copilot.vim'

call vundle#end() 

filetype plugin indent on

" Indent 
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" LSP
let g:lsp_diagnostics_enabled = 0
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" TS & JS
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'javascript support using typescript-language-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
    \ 'whitelist': ['javascript', 'javascript.jsx', 'typescript'],
    \ })
endif

" PHP
au User lsp_setup call lsp#register_server({
  \ 'name': 'intelephense',
  \ 'cmd': {server_info->['node', expand('~/.yarn/bin/intelephense'), '--stdio']},
  \ 'initialization_options': {"storagePath": "~/.cache/intelephense"},
  \ 'whitelist': ['php'],
  \ })

" Rust 
" https://qiita.com/k_takashi0309/items/9c23b83fdf1d50afcf5b
" https://github.com/dense-analysis/ale/blob/master/doc/ale-rust.txt
autocmd BufReadPost *.rs setlocal filetype=rust
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
if executable('rls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'rls',
    \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
    \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
    \ 'whitelist': ['rust'],
    \ })
  " NOTE: 検証中
  " .か:を押したときに自動的にオムニ補完
  autocmd FileType rust setlocal omnifunc=lsp#complete
  autocmd FileType rust imap <expr> . ".\<C-X>\<C-O>"
  autocmd FileType rust imap <expr> : ":\<C-X>\<C-O>"
endif
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
" let g:ale_rust_cargo_use_clippy = 1 " cargo checkではなくcargo clippyに変わるらしい

" TypeScript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" CSS
autocmd BufNewFile,BufRead *.scss set filetype=sass
if executable('css-languageserver')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'css-languageserver',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
    \ 'whitelist': ['css', 'less', 'sass'],
    \ })
endif

" Python
if executable('pyls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
endif

" Digdag
autocmd BufNewFile,BufRead *.dig set filetype=yaml
autocmd Syntax yaml setl indentkeys-=<:> indentkeys-=0#

" " Prettier
" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0

" KeyMap
nnoremap <silent> gr :tabprevious<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

set inccommand=split

" Recommend
set nocompatible            
set showmatch               
set ignorecase              
set smartcase               
set mouse=v                 
set hlsearch                
set expandtab               
set autoindent              
set number                  
set wildmode=longest,list   

" Tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

augroup vimrc
  autocmd! FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=0
augroup END

" Other
set clipboard=unnamedplus
" カレントディレクトリからホームディレクトリまで.tagsを探す
set tags=.tags;~
set noundofile
set noswapfile
set nobackup
set ruler
set cmdheight=2
set laststatus=2
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P
set title
set wildmenu
set showcmd
set browsedir=buffer
set incsearch
set hidden
set list
set listchars=tab:>\ ,extends:<
set smartindent
set whichwrap=b,s,h,l,<,>,[,],~
set tw=0
set visualbell t_vb=

set background=dark
colorscheme molokai

syntax on

highlight MatchParen cterm=NONE ctermfg=red ctermbg=black
highlight LineNr ctermfg=darkyellow

filetype on
