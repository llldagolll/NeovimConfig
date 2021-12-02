" pythonのpathを明示
" 文字コードをUTF-8
set encoding=UTF-8
" バック␣の挙動を通常と同じにする
set backspace=2
set nobackup
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
" set autoread
" 入力中のコマンドをステータスに表示にする
set showcmd
set clipboard+=unnamed
"コマンドラインの保管
set wildmode=list:longest
set modifiable
set write
set nowrap
"折り返し時に表示単位での移動ができるようにする
nnoremap j gj
nnoremap k gk
" nnoremap j k
" nnoremap k j

" 分割系コマンドキーマップ
nnoremap <C-h><C-h> <C-w>h
nnoremap <C-l><C-l> <C-w>l
nnoremap <C-j><C-j> <C-w>j
nnoremap <C-k><C-k> <C-w>k


set expandtab
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"ディレクトリツリーを表示
map <C-a> :NERDTreeToggle<CR>

" VIM起動時ファイルのほうにカーソルを移す
function s:MoveToFileAtStart()
	call feedkeys("\<C-w>\w")
	call feedkeys("\l")
endfunction

"NERDTreeファイル移動時自動で閉じる
let NERDTreeQuitOnOpen=1

" 因数なしでvimを開いたらNERDTreeを起動、
"引数ありならNERDTreeは起動せず、引数で渡されたファイルを開く。
autocmd vimenter * if !argc() | NERDTree | endif | call s:MoveToFileAtStart()



" 補完表示時のEnterで改行をしない
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"

" Tab補完

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"




nnoremap <F3> :noh<CR>
""他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif"
nnoremap <silent><F4> :only<CR>
nnoremap <silent><F5> :QuickRun<CR>
nnoremap <silent><leader>r :QuickRun<CR>
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
cab t tabe
cab qr QuickRun

"inoremap ' <Enter> ''<Left><CR><ESC><S-o>
au FileType qf nnoremap <silent><buffer>q :quit<CR>

" 行数を表示
set number

" カラースキームを設定
" colorscheme ron
" colorscheme molokai
" colorscheme lucius
colorscheme tender
set statusline=2
"
" 行末の空白削除
autocmd BufWritePre * :%s/\s\+$//e

let g:python3_host_prog = '/usr/bin/python3'

"マウスの操作を有効化
set mouse-=a
set scrolloff=1
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

let g:airline_theme='raven'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set ambiwidth=single

set splitright

" dein Scripts--------------------
if &compatible
        set nocompatible        "Be iMproved
nnoremap <Leader>f :noh<CR>
endif

" let s:dein_path = expand('C:\Users\owner\.cache\dein')
let s:dein_path = expand('~/.cache/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
        if !isdirectory(s:dein_repo_path)
                execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
        endif
        execute 'set runtimepath^=' . s:dein_repo_path
endif



if dein#load_state(s:dein_path)
        call dein#begin(s:dein_path)

        let g:config_dir = expand('~/.config/nvim/userconfig')
        let s:toml = g:config_dir . '/plugin.toml'
        let s:lazy_toml = g:config_dir . '/plugin_lazy.toml'

        "TOML 読み込み


        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
        call dein#add('Shougo/neco-vim')




        call dein#load_toml(s:toml, {'lazy': 0})
        call dein#load_toml(s:lazy_toml, {'lazy': 1})

        call dein#end()
        call dein#save_state()
endif



" Required
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
        call dein#install()
endif

"End dein Scripts---------------------------
