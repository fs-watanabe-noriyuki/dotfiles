syntax enable
set background=light
colorscheme solarized
set t_ut=

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

" jjでエスケープの変わり
inoremap jj <Esc>

" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
imap [ []<left>
imap { {}<left>
imap ( ()<left>

