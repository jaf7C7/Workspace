"
" When in doubt:
"
" 'An Introduction To Display Editing With Vi' https://docs.freebsd.org/44doc/usd/12.vi/paper.html
" 'Ex Reference Manual'                        https://docs.freebsd.org/44doc/usd/10.exref/paper.html
" 'Differences between Vim and Vi'             https://vimhelp.org/vi_diff.txt.html#/
" 'compatible' - vimhelp.org                   https://vimhelp.org/options.txt.html#%27compatible%27
"

"
" Vi compatible (exrc)
"

set compatible
set autoindent
set tabstop=8
set shiftwidth=8
set nowrapscan
set noignorecase

" Remove annoying defaults
map  <NOP>
map  <NOP>
map K <NOP>

" Useful macros
map @! :w|!clear && node %
map @$ :w|!tmux splitw bash -c 'node -i -e "$(< %)"'

" Appearance
hi ColorColumn  cterm=NONE      ctermfg=7    ctermbg=0
hi Directory    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi EndOfBuffer  cterm=NONE      ctermfg=NONE ctermbg=NONE
hi ErrorMsg     cterm=reverse   ctermfg=NONE ctermbg=NONE
hi LineNr       cterm=NONE      ctermfg=NONE ctermbg=NONE
hi ModeMsg      cterm=NONE      ctermfg=NONE ctermbg=NONE
hi MoreMsg      cterm=reverse   ctermfg=NONE ctermbg=NONE
hi NonText      cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Pmenu        cterm=NONE      ctermfg=7    ctermbg=NONE
hi PmenuSel     cterm=reverse   ctermfg=NONE ctermbg=NONE
hi PmenuSbar    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi PmenuThumb   cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Question     cterm=NONE      ctermfg=NONE ctermbg=NONE
hi SpecialKey   cterm=NONE      ctermfg=NONE ctermbg=NONE
hi StatusLine   cterm=reverse   ctermfg=NONE ctermbg=NONE
hi StatusLineNC cterm=standout  ctermfg=NONE ctermbg=NONE
hi Title        cterm=NONE      ctermfg=NONE ctermbg=NONE
hi VertSplit    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Visual       cterm=reverse   ctermfg=NONE ctermbg=NONE
hi WarningMsg   cterm=NONE      ctermfg=NONE ctermbg=NONE

"
" Vim version has 'eval' (vimrc)
"
if 1

set nocompatible
set autoindent
set copyindent
set tabstop=8
set shiftwidth=8
set nowarn
set timeout
set timeoutlen=600
set ttimeoutlen=1
set nowrapscan
set noignorecase
set nomodeline
set history=50
set noswapfile
set listchars=eol:$,tab:\|-,trail:+
set colorcolumn=80
set noruler
set number
filetype on

" ':make' will lint the script, ':cnext/:cprev' will cycle through errors
autocmd FileType sh,bash set makeprg=shellcheck\ -f\ gcc\ %

" Set pane/window title in screen/tmux
if &term =~ '^\%(screen\|tmux\).*'
	set title
	set titlestring=vim\ %F
	set t_ts=_
	set t_fs=\
	" Avoid 'Thanks for flying Vim' on exit
	autocmd VimLeave * :set t_ts=_\
endif

" Syntax highlighting
syntax enable
set t_Co=16
set background=dark
hi Boolean        cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Character      cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Comment        cterm=NONE      ctermfg=7    ctermbg=NONE
hi Conditional    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Constant       cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Debug          cterm=reverse   ctermfg=3    ctermbg=NONE
hi Define         cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Delimiter      cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Error          cterm=NONE      ctermfg=NONE ctermbg=1
hi Exception      cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Float          cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Function       cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Identifier     cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Ignore         cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Include        cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Keyword        cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Label          cterm=NONE      ctermfg=NONE ctermbg=NONE
hi LineNr         cterm=NONE      ctermfg=8    ctermbg=NONE
hi Macro          cterm=NONE      ctermfg=NONE ctermbg=NONE
hi MatchParen     cterm=underline ctermfg=NONE ctermbg=NONE
hi Normal         cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Number         cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Operator       cterm=NONE      ctermfg=NONE ctermbg=NONE
hi PreCondit      cterm=NONE      ctermfg=NONE ctermbg=NONE
hi PreProc        cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Repeat         cterm=NONE      ctermfg=NONE ctermbg=NONE
hi SpecialChar    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi SpecialComment cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Special        cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Statement      cterm=NONE      ctermfg=NONE ctermbg=NONE
hi StorageClass   cterm=NONE      ctermfg=NONE ctermbg=NONE
hi String         cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Structure      cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Tag            cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Todo           cterm=NONE      ctermfg=1    ctermbg=NONE
hi TrailingSpace  cterm=NONE      ctermfg=NONE ctermbg=0
hi Typedef        cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Type           cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Underlined     cterm=NONE      ctermfg=NONE ctermbg=NONE
match TrailingSpace '\s\+$'

endif
