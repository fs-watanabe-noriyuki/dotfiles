set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" tmuxで編集モードのカーソルを変形
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" ESCの応答速度向上
if !has('gui_running')
    set timeout timeoutlen=1000 ttimeoutlen=50
endif

set cursorline    " 編集行の表示を変える
set cursorcolumn  " 編集列の表示を変える
set number        " 行番号表示
set expandtab     " タブの代わりに空白を使う
set tabstop=4     " タブの幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅（デフォルトでは無効: 0）
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set scrolloff=3   " スクロールを画面端より早く開始
set hlsearch      " ハイライトサーチを有効に
set ignorecase    " 検索時に大文字小文字を区別しない
set smartcase     " 検索時に大文字を含んでいたら大小区別する
set ruler         " 右下にカーソル位置表示
set mouse=a       " マウス使用可


" 行頭・行末で左右移動で前後の行に移動
set whichwrap=b,s,h,l,<,>,[,],~

" enable backspace
set backspace=indent,eol,start

" dein detup
let s:dein_dir = $HOME . '/.vim/bundle'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " Load and cached toml
  " all plugins listed in toml
  call dein#load_toml(s:dein_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:dein_dir . '/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

