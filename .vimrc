if 1
    " バックスラッシュなどを自動でエスケープ
    noremap <expr> / getcmdtype() == '/' ? '\/' : '/'
    cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
    syntax on
    set t_Co=256
    set nocompatible
    set rtp+=~/.vim/bundle/Vundle.vim/
    filetype off
    call vundle#rc()
    Bundle 'VundleVim/Vundle.vim'
    Bundle 'thinca/vim-quickrun'
    Bundle 'tpope/vim-surround'
    "Bundle 'davidhalter/jedi-vim'
    "Bundle 'andviro/flake8-vim'
    Bundle 'nvie/vim-flake8'
    Bundle 'kevinw/pyflakes-vim'
    Bundle 'itchyny/lightline.vim'
    "Bundle 'yuratomo/w3m.vim'
    Bundle 'tpope/vim-fugitive'
    Bundle 'plasticboy/vim-markdown'
    Bundle 'mattn/emmet-vim'
    filetype on
    colorscheme molokai
    set tabstop=4
    set shiftwidth=4
    set list
    set autoindent
    set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
    set backspace=start,eol,indent
    set expandtab
    autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
    autocmd FileType html setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
    autocmd FileType javascript setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
    autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt
    autocmd BufNewFile index.html 0r $HOME/.vim/template/html.txt
    set fileencodings=utf-8,cp932,sjis,iso-2022-jp,euc-jp
    let g:quickrun_config={'*':{'split': ''}}
    set ruler
    set wildmenu
    set laststatus=2
    let g:jedi#popup_on_dot = 0
    let g:jedi#show_call_signatures = 0
    let g:jedi#rename_command = '<Leader>R'
    "inoremap jj <Esc>  入力モード中に素早くj二回でエスケープ
    "nmap <silent> <Esc><Esc> :nohlsearch<CR> <Esc>二回押しでハイライト消す
    " 検索後にジャンプした際に検索単語を画面中央に持ってくる
    nnoremap n nzz
    nnoremap N Nzz
    nnoremap * *zz
    nnoremap # #zz
    nnoremap g* g*zz
    nnoremap g# g#zz
    " j, k による移動を折り返されたテキストでも自然に振る舞うように変更
    nnoremap j gj
    nnoremap k gk
    " Ctrl + hjkl でウィンドウ間を移動
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    set paste
endif
