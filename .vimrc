set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
if $vim_local_settings!=""
    " For instance when there are sensitive commands that shouldn't be included
    " in a public repo.  Or, commands that only apply to a particular computer.
    source $vim_local_settings
endif

" make sure encoding correctly
" not if you get a CONVERSION ERROR on :w try :w ++enc=utf-8
scriptencoding utf-8

syntax on
filetype plugin indent on
set t_Co=256
set background=dark

" http://archive09.linux.com/feature/120126
" set statusline=%F%m%r%h%w\ %=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F\ %m%r%h%w\ %=F:%{&ff}\ T:%Y\ [\%03.3b\ 0x\%02.2B]\ x=%04v\ y=%04l/%L\ (%p%%)
set laststatus=2

colorscheme jellybeans

if has("gui_running")
    " Note: if you want to test environment variables make sure they're either
    " exported in your .bashrc, or .bash_profile; see:
    " http://stackoverflow.com/questions/882658/how-to-get-environment-variables-from-within-gvim
    if $living_room!=""
        set guifont=DejaVu\ Sans\ Mono\ 18  
    elseif $macbook=="true"
        set guifont=Menlo\ Regular:h12
    else
        set guifont=Lucida_Console:h14
    endif
    colorscheme evening
    set guifont=Lucida_Console:h14
    set lines=999 columns=999
    set guioptions-=T "remove toolbar
endif

if has("win32")
    set shell=cmd.exe
    set shellcmdflag=/c\ powershell.exe\ -NoLogo\ -NoProfile\ -NonInteractive\ -ExecutionPolicy\ RemoteSigned
    set shellpipe=|
    set shellredir=>
    
    try
        "VsVIM ill use VS defaults (see: https://github.com/jaredpar/VsVim/wiki/Defaults-for-Settings)
        set vsvim_useeditordefaults
    catch
    endtry
    let mapleader="\\"
else
    if $living_room
        if $living_room_mac_override!=""
            let mapleader = $living_room_mac_override
        else
            let mapleader = "<"
        endif
    elseif $debianbox!=""
        set guifont=Courier\ 10\ Pitch\ 11
        let mapleader = "\\"
    else
        let mapleader = "§"
    endif
endif

" cd to this
nmap <leader>cd :exe ":cd %:p:h"<CR>
function! CdToThis()
    exe ":cd %:p:h"
endfunction
com! CdToThis call CdToThis()


set runtimepath^=~/.vim/bundle/ctrlp.vim

" tab rename (taboo plugin)
nmap <leader>trn :TabooRename 

set viminfo='1000,f1,<500,s10,h,!

" Tabs etc
set shiftwidth=4
set sts=4
set tabstop=4
set et
set autoindent
nnoremap <leader>tt :set noet<CR>:retab!<CR>

"nnoremap <leader>tnx :set noet
"nnoremap <leader>tx :set et
nnoremap <leader>t2 :set shiftwidth=2<CR>:set tabstop=2<CR>:set sts=2<CR>
nnoremap <leader>t4 :set shiftwidth=4<CR>:set tabstop=4<CR>:set sts=4<CR>

" <ESC> alternative
imap jk <ESC>
"vmap jk <ESC>

" Quit vim
nmap QQ :qa<CR>
nmap QW :wqa<CR>

set lbr

" will automatically update file if changed externally (supressing W11 error)
set autoread

set scrolloff=6
set wildmode=longest,list 
set wildmenu
"set wildchar=<Tab>
set completeopt=longest,menu

set complete=.,w,b,u,t,i
" because of my tmux setup need to re-map C-k,l 
inoremap <Nul>] <C-x><C-]>
inoremap <Nul>d <C-x><C-D>
inoremap <Nul>e <C-x><C-E>
inoremap <Nul>f <C-x><C-F>
inoremap <Nul>i <C-x><C-I>
inoremap <Nul>k <C-x><C-K>
inoremap <Nul>l <C-x><C-L>
inoremap <Nul>n <C-x><C-N>
inoremap <Nul>o <C-x><C-O>
inoremap <Nul>p <C-x><C-P>
inoremap <Nul>u <C-x><C-U>
inoremap <Nul>v <C-x><C-V>
inoremap <Nul>y <C-x><C-Y>

" Other casualties of the tmux setup:
imap <leader>k <C-K>

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

set cursorline

" http://vim.wikia.com/wiki/Backspace_and_delete_problems
" set backspace=2

set encoding=utf-8

set wildmode=longest:full

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:›\ ,eol:¬,trail:·
" Invisible character colors
highlight NonText guifg=#4a4a59  guibg=NONE
highlight SpecialKey guifg=#4a4a59 guibg=NONE

nmap <C-q> :q<CR>
imap <C-q> <ESC>:q<CR> 
nmap <C-s> <ESC>:w<CR>

map Y y$

" re-assign "* to p
noremap <leader>p :let @p=@*<CR>

" alternative for newlining
map <leader>o myo<ESC>`y
map <leader>O myO<ESC>`y
inoremap <leader>o <ESC>myo<ESC>`ya
inoremap <leader>O <ESC>myO<ESC>`ya

map <leader>hs :set list!<CR>
map <leader>s :w<CR>
"visually select last match
noremap <leader>v v//e<CR> 
noremap <leader>b :ls<CR>:buffer<Space>
noremap <leader>ln :set nu!<CR>
noremap <leader>lr :set relativenumber!<CR>
"(note) To insert the elipsis, press ctrl-vu followed by the numeric code for elipsis: 2026
noremap <leader>sb :set showbreak=…<CR>
nnoremap <leader>wso :w \| so %<CR>
nnoremap <leader>ws. :w \| so $HOME/.vimrc<CR>\| e
"http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
nnoremap <leader>wsudo mm:w !sudo tee %<CR><CR>L`m

" copying my path seems to be something I do quite a bit so here's
" two handy commands, the first echo the current file whilst in insert mode
" old way (inserts new line) inoremap <leader>cp <ESC>:put =expand('%:p')<CR>
inoremap <leader>cp <C-r>=expand('%:p')<CR>
" in normal mode this copies it into the "p register
nnoremap <leader>cpp "=expand("%:p")<CR>:let @p=@%<CR>
nnoremap <leader>cp: "=expand("%:p")<CR>:exec("! clear && echo -n " . shellescape(expand("%:p")) . " \| pbcopy")<CR><CR>
nnoremap <leader>ep :echo expand("%:p")<CR>

" nopaste / paste toggle (and then display new toggle value: "paste" or "nopaste")
nnoremap <leader>np :set paste!<CR>:set paste?<CR>
inoremap <leader>np <C-o>:set paste!<CR><C-o>:set paste?<CR>

nnoremap <leader>r q:?s\/<CR><CR>
nnoremap <leader>rcs :w<CR>:Shell cat % \| coffee -s<CR>
nnoremap <leader>rrb :w<CR>:Shell ruby %<CR>
nnoremap <leader>rsh :w<CR>:Shell cat % \| /bin/sh -s<CR>
nmap <leader>mg :w<CR>:Shell cat % \| mongo<CR>:set syntax=javascript<CR>

" rust
nmap <leader>rt :w<CR>:Shell rustc --test % & ./`echo % \| sed s/\\.[^\\.]*$//`<CR>

" syntax association
" (Note if, when opening -- vimgrep etc. -- and syntax not applied reload with :e
autocmd BufNewFile,BufRead *.pp set syntax=ruby
autocmd BufNewFile,BufRead *.json set syntax=javascript
autocmd BufNewFile,BufRead *.eex set syntax=html
autocmd BufNewFile,BufRead *.md set syntax=markdown
autocmd BufNewFile,BufRead *.sh.inc set syntax=sh
autocmd BufNewFile,BufRead *.toneq set syntax=toneq
autocmd BufNewFile,BufRead *.tl set syntax=timeline
autocmd BufNewFile,BufRead *.js set tabstop=2 | set sts=2 | set shiftwidth=2

syntax region toneqMdSnip matchgroup=TMdSnip start="(|" end="|)" 
hi link TMdSnip Markdown

" export feature files to HTML
nnoremap <leader>rfhtml :TO<CR>:w<CR>:!open -a Safari %<CR><CR>

"autocmd VimEnter * SessionOpenLast

"disabling this in favor of other things; don't use it really
"nnoremap <leader>a ggVG<CR> 

" Yanks to end of file... left it in because + is interesting; as I understand it % tranlsate to <1,%> that a '+' after the is added to the line number ($+1?)... I think this is pointless in this case but don't know for sure.
nnoremap <leader>Y :%y+<CR>

"vimdiff, force line wrapping (http://stackoverflow.com/questions/16840433/forcing-vimdiff-to-wrap-lines)
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" insert (crude snippets)
"inoremap <leader>pi <ESC>"='\|> '<CR>pyiw==a
inoremap <leader>pi \|><Space>
"inoremap <leader><leader> <leader>

"resizing stuff 

" elixir stuf
nmap <leader>eln Go###::SECTION###::FILE :r!echo $(now).exkJo###::SCRIPT###::OUTPUT###::END?SEea 
" note: el_save puts file name @a (also the prefix 'j' (down) is a hack to make sure run works on SECTION line.
nmap <leader>el_savefile j$?###::FILEfEwv$h"ayV/###::k:w! %:p_run/a
nmap <leader>el_savescript $?###::SECTION/###::SCRIPTV/###::k:w! %:p_run/script.exs:r!sed -i -e 's/^\$\(.*\)/IO.inspect (\1)/g' %:p_run/script.exs
" assumes @a is filename and assigns cmd to @s
nmap <leader>el_scriptcmd :let @s='elixir -r "%:p_run/a" "%:p_run/script.exs"'
nmap <leader>el_getready mm?###::SECTION/###::OUTPUTmo:r!mkdir -p %:p_run<leader>el_savefile<leader>el_savescript
nmap <leader>el_render 'oyypO###::RUN :r!datekJj:.!time -p smo/###::3k3J`m 
" elixir simple run, loads file + runs script
nmap <leader>elr <leader>el_getready<leader>el_scriptcmd<leader>el_render
" elixir as with simple but in mix enivornment
nmap <leader>el_mixscriptcmd :let @s='mix-run.sh "%:p_run/script.exs"'
nmap <leader>elm <leader>el_getready<leader>el_mixscriptcmd<leader>el_render 
" elixir clear
nmap <leader>elc mm?###::SECTION/###::OUTPUTjV/###::ENDkd'm

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toneq START

"" IRREGULAR
nmap <leader>tsx :set syntax=toneq<CR>
imap <leader>tin <ESC>:s/\s*$/ /<CR>A(<BAR><Space><Space><BAR>)<esc>2hi
nmap <leader>tin :s/\s*$/ /<CR>A(<BAR><Space><Space><BAR>)<esc>2hi
nmap <leader>ton <ESC>o(<BAR><CR><CR><BAR>)<esc>ki
"nmap <leader>tnew G?>>TODOs(()mm?^201.-..-..V'mk"aygvo:.!now -DA (:r!date "+\%A"kJA \| <ESC>"=strftime("%H%M")<CR>pA aim=6hrs, break=1.5hrs \| 0; \| )"apdd
" indent
nmap <leader>t< 0:s/^\([TGEQ]\)\( \.\)/\1<CR>
nmap <leader>t> 0:s/^\([TGEQ]\)/\1 .<CR>

"" a(ppend?) -- why is this used?
nnoremap <leader>ta oT<SPACE> 
nnoremap <leader>ta1 oT<SPACE><ESC>1a.<SPACE><ESC>A
nnoremap <leader>ta2 oT<SPACE><ESC>2a.<SPACE><ESC>A
nnoremap <leader>ta3 oT<SPACE><ESC>3a.<SPACE><ESC>A
nnoremap <leader>ta4 oT<SPACE><ESC>4a.<SPACE><ESC>A
nnoremap <leader>ta5 oT<SPACE><ESC>5a.<SPACE><ESC>A
nnoremap <leader>ta6 oT<SPACE><ESC>6a.<SPACE><ESC>A

" (b)reak s=start, f=finish
nmap <leader>tbs mmG?^201.-..-.. (.*)<CR>$F;a[<ESC>"=strftime("%H%M")<CR>pa-];<ESC>F-mzf]a(\|<SPACE>\|)<ESC>:w<CR>F<SPACE>i<SPACE>
nmap <leader>tbf `z<ESC>"=strftime("%H%M")<CR>p`m:w<CR>

" (c)hild t=task, g=goal, q=question, e=event
nmap <leader>tct yyp:s/^\([TGEQ]\)\([ \.]*\).*$/T .\2A
nmap <leader>tcg yyp:s/^\([TGEQ]\)\([ \.]*\).*$/G .\2A
nmap <leader>tcq yyp:s/^\([TGEQ]\)\([ \.]*\).*$/Q .\2A
nmap <leader>tce yyp:s/^\([TGEQ]\)\([ \.]*\).*$/E .\2[·30] f[a

" (d)ay s=start, f=finished
nmap <leader>tds G?>>TODOs(()mm?^201.-..-..V'mk"aygvo:.!now -DA (:r!date "+\%A"kJA \| <ESC>"=strftime("%H%M")<CR>pA aim=6hrs, break=1.5hrs \| 0; \| )"apdd
nmap <leader>tdf G?^201.-..-..<CR>$F\|a <ESC>"=strftime("%H%M")<CR>p:w<CR>

" executing line (defined as - with 0+ notes and white space after it)
" g=go, n=note, c=complete, a=abandoned, s=suspended, r=reestimate, ?=unknown complete
nmap <leader>txg G?-\(\s*(\|.*\|)\)*\s*$<CR>$
nmap <leader>txn G?-\(\s*(\|.*\|)\)*\s*$<CR>:s/\s*$//<CR>A (\|<ESC>"=strftime("%H%M")<CR>pA:<Space><Space><BAR>)<esc>2h:w<CR>i
nmap <leader>txc G?-\(\s*(\|.*\|)\)*\s*$<CR>:s/\s*$//<CR>A c:<ESC>"=strftime("%H%M")<CR>p:w<CR>
nmap <leader>txa G?-\(\s*(\|.*\|)\)*\s*$<CR>:s/\s*$//<CR>A (\| reason? \|) a:<ESC>"=strftime("%H%M")<CR>p:w<CR>?reason<CR>f<SPACE>i<SPACE>
nmap <leader>txs G?-\(\s*(\|.*\|)\)*\s*$<CR>:s/\s*$//<CR>A (\| because? \|) s:<ESC>"=strftime("%H%M")<CR>p:w<CR>?because<CR>f<SPACE>i<SPACE>
nmap <leader>txr G?-\(\s*(\|.*\|)\)*\s*$<CR>:s/\s*$//<CR>A [] - (\| reestimate \|) <ESC>F]"=strftime("%H%M")<CR>P:w<CR>a·
" (?)unknown time c=complete
nmap <leader>tx? $DA - c:?<ESC>:w<CR>
" t?a TBC

" (l)ine r=reset, e=estimate, x=execute, s=suspend, g=go, G=go (no estimate), a=abandon
" (note the dot is a 'middle dot' diagraph .M) - was test
nmap <leader>tlr A[]<ESC>0/\s*[<CR>D:w<CR>
imap <leader>tle <ESC>:s/\s*$//<CR>A [·]<ESC>F·a
nmap <leader>tle :s/\s*$//<CR>A [·]<ESC>F·a
imap <leader>tlg <ESC>:s/\s*$//<CR>A [] - <ESC>F]"=strftime("%H%M")<CR>P:w<CR>a·
nmap <leader>tlg :s/\s*$//<CR>A [] - <ESC>F]"=strftime("%H%M")<CR>P:w<CR>a·
nmap <leader>tlG :s/\s*$//<CR>A [] - <ESC>F]"=strftime("%H%M")<CR>P:w<CR>a·<ESC>
nmap <leader>tlx $F·"=strftime("%H%M")<CR>P:s/\s*$//<CR>A - <ESC>:w<CR>
nmap <leader>tls :s/\s*$//<CR>A (\| because? \|) s:<ESC>"=strftime("%H%M")<CR>p:w<CR>?because<CR>f<SPACE>i<SPACE>
imap <leader>tla <ESC>$T["=strftime("%H%M")<CR>PA - <ESC>:w<CR>
nmap <leader>tla :s/\s*$//<CR>A - (\| reason? \|) a:<ESC>"=strftime("%H%M")<CR>p:w<CR>?reason<CR>f<SPACE>i<SPACE>
imap <leader>tla <ESC>:s/\s*$//<CR>A - (\| reason? \|) a:<ESC>"=strftime("%H%M")<CR>p:w<CR>?reason<CR>f<SPACE>i<SPACE>
nmap <leader>tlc :s/\s*$//<CR>A - (\| comments: \|) c:<ESC>"=strftime("%H%M")<CR>p:w<CR>?comments<CR>f<SPACE>i<SPACE>
nmap <leader>tlc <ESC>:s/\s*$//<CR>A - (\| comments: \|) c:<ESC>"=strftime("%H%M")<CR>p:w<CR>?comments<CR>f<SPACE>i<SPACE>

" (s)ibling t=task, g=goal, q=question, e=event
nmap <leader>tst yyp:s/^\([TGEQ]\)\([ \.]*\).*$/T\2A
nmap <leader>tsg yyp:s/^\([TGEQ]\)\([ \.]*\).*$/G\2A
nmap <leader>tsq yyp:s/^\([TGEQ]\)\([ \.]*\).*$/Q\2A
nmap <leader>tse yyp:s/^\([TGEQ]\)\([ \.]*\).*$/E\2[·30] f[a

" (n)ew t=task, g=goal, q=question, E=event(known start time), e=event(unknown start time)
nmap <leader>tnt G?>>TODO(()OT 
nmap <leader>tng G?>>TODO(()OG 
nmap <leader>tnq G?>>TODO(()OQ 
nmap <leader>tnE G?>>TODO(()OE [·30] <ESC>F[a
nmap <leader>tne G?>>TODO(()OE [·30] <ESC>F[a?<ESC>A

" (f)inish c=complete, a=abandoned, s=suspended

" (s)uspend t=task, g=goal, q=question, e=event
"nmap <leader>tst yyp:s/^\([TGEQ]\)\([ \.]*\).*$/T\2A
"nmap <leader>tsg yyp:s/^\([TGEQ]\)\([ \.]*\).*$/G\2A
"nmap <leader>tsq yyp:s/^\([TGEQ]\)\([ \.]*\).*$/Q\2A
"nmap <leader>tse yyp:s/^\([TGEQ]\)\([ \.]*\).*$/E\2[·30] f[a

" (z) f=fold
nmap <leader>tzf mz$?^(\|<CR>v/^\|)<CR>$zf


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Toneq END

" gf (goto file) such that it will create a new file if it doesn't exist... (http://stackoverflow.com/questions/1050745/unable-to-create-a-file-from-a-path-in-vim)
nmap gf :e <cfile><CR>
nmap gff :e! <cfile><CR>
nmap gfw :w<CR>:e <cfile><CR>
"nmap gfm :w<CR>:e <cfile><CR>mF<C-o>0v$h"fygv§:
nmap gfm mMyyp:s/^\s*\([^\s].*\)$/\1/e<CR>:s/ /\\ /ge<CR>0"aDdd:w<CR>:e <C-r>a<CR>mF`M:let @f=@a<CR>
nmap gft mMyyp:s/^\s*\([^\s].*\)$/\1/e<CR>:s/ /\\ /ge<CR>0"aDdd:w<CR>:e <C-r>a<CR>mF`M:tabnew<CR>'F:let @f=@a<CR>
nmap g% :e %:p:h/<cfile><CR>

" new files
nmap <leader>n. :new %:p:h/

nmap <leader>hl :set hlsearch!<CR>
nmap <leader>scl :set cursorline!<CR>
nmap <leader>scc :set cursorcolumn!<CR>
nmap <leader>sw :set wrap!<CR>

set clipboard=unnamed
" uisng pbcopy, from: http://stackoverflow.com/questions/677986/vim-copy-selection-to-os-x-clipboard
vmap <D-x> :!pbcopy<CR>  
vmap <D-c> :w !pbcopy<CR><CR>
"vnoremap : y:exec("! clear && echo " . shellescape(@", 1) . " \| tr -d '\\n' \| pbcopy")<CR><CR>gv
"vnoremap : y:exec("! clear && echo " . shellescape(@", 1) . " \| sed -e '/$/N; s/\\n$/r/g; ' ")
"vnoremap : y:exec("! clear && echo " . shellescape(@", 1) . "\| awk 'NR>1{ print l } {l=$0}'  \| pbcopy")
"vnoremap : y:exec("! clear && echo " . shellescape(@", 1) . "> $TMPDIR/vim_pbcopy")
" wow, it took a long time to find the -n option, all the above didn't work for me :(
vmap <leader>: y:exec("! clear && echo -n " . shellescape(@0) . " \| pbcopy")<CR><CR>

" Fuzzy finding short cuts
nmap <leader>f. :CtrlPCurFile<CR>
nmap <leader>ff :CtrlPFile
nmap <leader>f/ :CtrlPCurWD<CR>
nmap <leader>fb :CtrlPBuffer<CR>

" Spelling and such
nnoremap <leader>zz :set spell!<CR>
nnoremap <leader>zs z=
nnoremap <leader>z1 1z=
nnoremap <leader>z2 2z=
nnoremap <leader>z3 3z=
nnoremap <leader>zi l[seas

" From vimcasts (use :Wrap and Cmd+j,k etc. for moving within wrapped lines)
command! -nargs=* Wrap set wrap linebreak nolist
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" moving about splits... doesn't work, don't know why :(
" nmap <leader>test <C-w><C-l>
"nnoremap <C-H> <C-W><C-H>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>

" Based on following, kinda works
" http://stackoverflow.com/questions/1269603/to-switch-from-vertical-split-to-horizontal-split-fast-in-vim
nmap <leader>wl <C-W>t<C-W>L
nmap <leader>wh <C-W>t<C-W>H
nmap <leader>wj <C-W>t<C-W>J
nmap <leader>wk <C-W>t<C-W>K

" Yeah, these are more useful as example TBH, too complex to remember
nmap <leader>spbh  :botright sp<CR>
nmap <leader>spbv  :botright vsp<CR>
nmap <leader>spbnh :botright new<CR>
nmap <leader>spbnv :botright vnew<CR>
nmap <leader>spth :topleft sp<CR>
nmap <leader>sptv :topleft vsp<CR>
nmap <leader>sptnh :topleft new<CR>
nmap <leader>sptnv :topleft vnew<CR>

set spell spelllang=en_gb
nnoremap <leader>sp :set spell!<CR>
inoremap <leader>sp <ESC>:set spell!<CR>
set nospell

command! Copyfile let @*=substitute(expand("%:p"), '/', '\', 'g')
nnoremap <Leader>cf :Copyfile<CR>

" Markdown helpers
nmap <leader>md= yypv$hr=
nmap <leader>md- yypv$hr-
nmap <leader>mdshow :silent exe "!md-chrome.sh %"<CR>:redraw!<CR>

nmap <leader>soc <ESC>"=strftime("%A %F - %R")<CR>p
nnoremap <leader>scr :r !today<CR><ESC>A/scratch.md<ESC>
nnoremap <leader>today o<ESC>"=strftime("%F")<CR>p
inoremap <leader>today <ESC>"=strftime("%F")<CR>pa
imap <leader>now <ESC>"=strftime("%H%M")<CR>pa
imap <leader>Now <ESC>"=strftime("%R")<CR>pa
imap <leader>NOw <ESC>"=strftime("%F - %R")<CR>pa
imap <leader>NOW <ESC>"=strftime("%A %F - %R")<CR>pa
" recommend <leader>dl (this is more internal)
nmap <leader>later o<ESC>i<CR><ESC>"=". . . " . strftime("%R") . " . . ."<CR>pA<CR><CR><ESC>
nmap <leader>dnew G/^EOF.<CR>(()o<CR><ESC><leader>soc<leader>md=o<CR>
nmap <leader>dnow G/^EOF.<CR>((
nmap <leader>dl G/^EOF.<CR>(()k<leader>latera
nmap <leader>dday :new `now -d`.md<CR>10i<CR><ESC>oEOF.<ESC>gg<leader>soc<leader>md=o<CR>

let g:session_autoload = 'no'
let g:session_autosave = 'no' 
let g:session_autosave_periodic = 0

"source: http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#]'
        let word = expand(word)
      endif
      "let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'.expanded_cmdline 
  1
endfunction

nmap <C-W>2 :call Wipeout()<CR>
" from: http://stackoverflow.com/questions/1534835/how-do-i-close-all-buffers-that-arent-shown-in-a-window-in-vim
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" From: http://www.kevssite.com/2009/04/21/using-vi-as-a-hex-editor/ 
" The following maps the F8 key to toggle between hex and binary (while also setting the
" noeol and binary flags, so if you :write your file, vim doesn't perform unwanted conversions.  
nnoremap <leader>hex :call HexMe()<CR>
let $in_hex=0
function! HexMe()
    set binary
    set noeol
    if $in_hex>0
        :%!xxd -r
        let $in_hex=0
    else
        :%!xxd
        let $in_hex=1
    endif
endfunction

