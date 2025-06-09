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

if has("gui_running")
    " Note: if you want to test environment variables make sure they're either
    " exported in your .bashrc, or .bash_profile; see:
    " http://stackoverflow.com/questions/882658/how-to-get-environment-variables-from-within-gvim
    if $living_room!=""
        set guifont=DejaVu-Sans-Mono:18  
    elseif $macbook=="true"
        set guifont=Menlo-Regular:h26
    else
        "set guifont=DejaVu-Sans-Mono-Bold:18
        set guifont=Menlo-Regular:h26
    endif
    colorscheme evening
    " set guifont=Lucida_Console:h14
    set lines=999 columns=999
    set guioptions-=T "remove toolbar

    hi iCursor guifg=white guibg=yellow
    hi Cursor guifg=white guibg=green
endif

if has("win32")
    set shell=cmd.exe
    set shellcmdflag=/c\ powershell.exe\ -NoLogo\ -NoProfile\ -NonInteractive\ -ExecutionPolicy\ RemoteSigned
    set shellpipe=|
    set shellredir=>
    
    try
        "VsVIM will use VS defaults (see: https://github.com/jaredpar/VsVim/wiki/Defaults-for-Settings)
        set vsvim_useeditordefaults
    catch
    endtry
    let mapleader="§"
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



syntax on
filetype plugin indent on
set t_Co=256
set background=dark

colorscheme jellybeans

" sets the visual highlighting to work well on terminals
hi Visual term=reverse cterm=reverse guibg=Grey
" use blue for default
"hi CursorLine   cterm=NONE ctermbg=darkblue guibg=darkblue
hi CursorLine ctermfg=NONE ctermbg=NONE cterm=inverse guifg=NONE guibg=NONE gui=inverse

" change background to default for current shell
nmap <leader>hibx :hi Normal ctermbg=none \| hi NonText ctermbg=none<CR>
" force black background
nmap <leader>hibb :hi Normal ctermbg=black \| hi NonText ctermbg=black<CR>
" force light grey background
nmap <leader>hibg :hi Normal ctermbg=lightgreen \| hi NonText ctermbg=lightgreen<CR>
" set a light colorscheme
nmap <leader>hil :colorscheme morning<CR>
" set a dark colorscheme
nmap <leader>hid :colorscheme jellybeans<CR><leader>hibx

" set line highlight to red
nmap <leader>hicr :hi CursorLine   cterm=NONE ctermbg=darkred guibg=darkred<CR>
" set line highlight to blue
nmap <leader>hicu :hi CursorLine   cterm=NONE ctermbg=darkblue guibg=darkblue<CR>



" http://archive09.linux.com/feature/120126
" set statusline=%F%m%r%h%w\ %=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F\ %m%r%h%w\ %=F:%{&ff}\ T:%Y\ [\%03.3b\ 0x\%02.2B]\ x=%04v\ y=%04l/%L\ (%p%%)
set laststatus=2
highlight Cursor ctermfg=green ctermbg=white guifg=white guibg=green
highlight iCursor ctermfg=white ctermbg=red guifg=white guibg=red
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" cd to this
nmap <leader>cd :exe ":cd %:p:h"<CR>
function! CdToThis()
    exe ":cd %:p:h"
endfunction
com! CdToThis call CdToThis()

" visually select lines, run and put in place; also put a copy of command
" before sandwiched with seperator lines
vmap <leader>bash "yymz"ygv:!bash<CR>'zO<ESC>80a-<ESC>yy"yp'zP

set runtimepath^=~/.vim/bundle/ctrlp.vim

" tab rename (taboo plugin)
nmap <leader>brn :TabooRename 
" create tab and ask for name
nmap <leader>bn :tabnew<CR>:TabooRename 

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
"inoremap <leader>cp <C-r>=expand('%:p')<CR>
" in normal mode this copies it into the "p register
nnoremap <leader>cpp "=expand("%:p")<CR>:let @p=@% \| echo @p<CR>
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
nmap <leader>tsqlj :w<CR>:Shell cat % \| run-sql.sh<CR>:set syntax=javascript<CR>
nmap <leader>tsqlr :w<CR>:Shell cat % \| run-sql.sh raw<CR>
nmap <leader>tsqlf :w<CR>:Shell cat % \| run-sql.sh fixed<CR>
nmap <leader>tsql<space>new :new<CR>:w `nowfile`.sql<CR>
vmap <leader>tsql<space>new "zy:new<CR>"zp:w `nowfile`.sql<CR>


" rust
nmap <leader>rt :w<CR>:Shell rustc --test % & ./`echo % \| sed s/\\.[^\\.]*$//`<CR>

" syntax association
" (Note if, when opening -- vimgrep etc. -- and syntax not applied reload with :e
autocmd BufNewFile,BufRead *.pp set syntax=ruby
autocmd BufNewFile,BufRead *.json set syntax=json | set foldmethod=syntax
autocmd BufNewFile,BufRead *.eex set syntax=html
autocmd BufNewFile,BufRead *.md set syntax=markdown
autocmd BufNewFile,BufRead *.sh.inc set syntax=sh
autocmd BufNewFile,BufRead *.toneq set syntax=toneq
autocmd BufNewFile,BufRead *.toneq2 so `g toneq`/scripts/*.vim | set syntax=toneq2
autocmd BufNewFile,BufRead *.tl set syntax=timeline
autocmd BufNewFile,BufRead *.js set tabstop=2 | set sts=2 | set shiftwidth=2

" syntax region toneqMdSnip matchgroup=TMdSnip start="(|" end="|)" 
" hi link TMdSnip Markdown

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
nmap <leader>ton o(<BAR><CR><CR><BAR>)<esc>ki
imap <leader>ton <ESC>o(<BAR><CR><CR><BAR>)<esc>ki
"nmap <leader>tnew G?>>TODOs(()mm?^20[12].-..-..V'mk"aygvo:.!now -DA (:r!date "+\%A"kJA \| <ESC>"=strftime("%H%M")<CR>pA aim=6hrs, break=1.5hrs \| 0; \| )"apdd
" indent
nmap <leader>t< 0:s/^\([TONEQG]\)\( \.\)/\1<CR>
nmap <leader>t> 0:s/^\([TONEQG]\)/\1 .<CR>

"" a(ppend?) -- why is this used?
nnoremap <leader>ta oT<SPACE> 
nnoremap <leader>ta1 oT<SPACE><ESC>1a.<SPACE><ESC>A
nnoremap <leader>ta2 oT<SPACE><ESC>2a.<SPACE><ESC>A
nnoremap <leader>ta3 oT<SPACE><ESC>3a.<SPACE><ESC>A
nnoremap <leader>ta4 oT<SPACE><ESC>4a.<SPACE><ESC>A
nnoremap <leader>ta5 oT<SPACE><ESC>5a.<SPACE><ESC>A
nnoremap <leader>ta6 oT<SPACE><ESC>6a.<SPACE><ESC>A

" (b)reak s=start, f=finish
nmap <leader>_gototoday G:exe '?^' . strftime('%Y-%m-%d')<CR>
nmap <leader>tsb mm<leader>_gototoday$F\|i[<ESC>"=strftime("%H%M")<CR>pa-];<ESC>F-mzf]a(\|<SPACE>\|)<ESC>:w<CR>F<SPACE>i<SPACE>
nmap <leader>tfb `z<ESC>"=strftime("%H%M")<CR>p`m:w<CR>
nmap <leader>tfb <leader>_gototoday:exe 's/-]/-' . strftime('%H%M') . ']/' <CR>`m:w<CR>

" (c)hild t=task, g=goal, q=question, e=event
nmap <leader>tct yyp:s/^\([TONEQG]\)\([ \.]*\).*$/T .\2A
nmap <leader>tcg yyp:s/^\([TONEQG]\)\([ \.]*\).*$/G .\2A
nmap <leader>tcq yyp:s/^\([TONEQG]\)\([ \.]*\).*$/Q .\2A
nmap <leader>tce yyp:s/^\([TONEQG]\)\([ \.]*\).*$/E .\2[·30] f[a

" defer: o=t(o)do, t=(t)oday, m=to(m)orrow
nmap <leader>tdo :w<CR>:execute ":!toneq -f % defer " . line('.') . " todo"<CR>:redraw!<CR>
nmap <leader>tdt :w<CR>:execute ":!toneq -f % defer " . line('.') . " " . strftime("%Y-%m-%d")<CR>:redraw!<CR>
"nmap <leader>tdm :w<CR>:execute ":!toneq -f % defer " . line('.') . ' $(date -d "tomorrow" "+\%Y-\%m-\%d")'<CR>:redraw!<CR>
nmap <leader>tdm :w<CR>:execute ":!toneq-run.sh % defer " . line('.') . " tomorrow"<CR>:redraw!<CR>
nmap <leader>td<SPACE>mon :w<CR>:execute ":!toneq-run.sh  % defer " . line('.') . ' "next mon"'<CR>:redraw!<CR>
nmap <leader>td<SPACE>tue :w<CR>:execute ":!toneq-run.sh  % defer " . line('.') . ' "next tue"'<CR>:redraw!<CR>
nmap <leader>td<SPACE>wed :w<CR>:execute ":!toneq-run.sh  % defer " . line('.') . ' "next wed"'<CR>:redraw!<CR>
nmap <leader>td<SPACE>thu :w<CR>:execute ":!toneq-run.sh  % defer " . line('.') . ' "next thu"'<CR>:redraw!<CR>
nmap <leader>td<SPACE>fri :w<CR>:execute ":!toneq-run.sh  % defer " . line('.') . ' "next fri"'<CR>:redraw!<CR>
nmap <leader>td<SPACE>sat :w<CR>:execute ":!toneq-run.sh  % defer " . line('.') . ' "next sat"'<CR>:redraw!<CR>
nmap <leader>td<SPACE>sun :w<CR>:execute ":!toneq-run.sh  % defer " . line('.') . ' "next sun"'<CR>:redraw!<CR>

" s=start, f=finished, g=go to (d)ay
nmap <leader>tsd G?>>TODO<CR>(()mm?^20[12].-..-..V'mk"aygvo:.!now -DA (:r!date "+\%A"kJA \| <ESC>"=strftime("%H%M")<CR>pA aim=6hrs, break=1.5hrs \| 0; \| )"apdd
nmap <leader>tfd <leader>_gototoday$F\|a <ESC>"=strftime("%H%M")<CR>p:w<CR>
nmap <leader>tgd G?^20[12].-..-..<CR>zz

" executing line (defined as - with 0+ notes and white space after it)
" g=go, n=note, c=complete, a=abandoned, s=suspended, e=reestimate, ?=unknown complete
nmap <leader>tgx G?-\(\s*(\|.*\|)\)*\s*$<CR>$
nmap <leader>tnx G?-\(\s*(\|.*\|)\)*\s*$<CR>:s/\s*$//<CR>A (\|<ESC>"=strftime("%H%M")<CR>pA:<Space><Space><BAR>)<esc>2h:w<CR>i
nmap <leader>tcx G?-\(\s*(\|.*\|)\)*\s*$<CR>:s/\s*$//<CR>A c:<ESC>"=strftime("%H%M")<CR>p:w<CR>
nmap <leader>tax G?-\(\s*(\|.*\|)\)*\s*$<CR>:s/\s*$//<CR>A (\| reason? \|) a:<ESC>"=strftime("%H%M")<CR>p:w<CR>?reason<CR>f<SPACE>i<SPACE>
nmap <leader>tsx G?-\(\s*(\|.*\|)\)*\s*$<CR>:s/\s*$//<CR>A (\| because? \|) s:<ESC>"=strftime("%H%M")<CR>p:w<CR>?because<CR>f<SPACE>i<SPACE>
nmap <leader>tex G?-\(\s*(\|.*\|)\)*\s*$<CR>:s/\s*$//<CR>A (\| reestimate \|) [] - <ESC>F]"=strftime("%H%M")<CR>P:w<CR>a·
" (?)unknown time c=complete
nmap <leader>tx? $DA - c:?<ESC>:w<CR>
" t?a TBC

" (l)ine r=reset, e=estimate, x=execute, s=suspend, g=go, G=go (no estimate), a=abandon
" (note the dot is a 'middle dot' diagraph .M) - was test
nmap <leader>trl A[]<ESC>0/\s*[<CR>D:w<CR>
imap <leader>tel <ESC>:s/\s*$//<CR>A [·]<ESC>F·a
nmap <leader>tel :s/\s*$//<CR>A [·]<ESC>F·a
imap <leader>tgl <ESC>:s/\s*$//<CR>A [] - <ESC>F]"=strftime("%H%M")<CR>P:w<CR>a·
nmap <leader>tgl :s/\s*$//<CR>A [] - <ESC>F]"=strftime("%H%M")<CR>P:w<CR>a·
nmap <leader>tGl :s/\s*$//<CR>A [] - <ESC>F]"=strftime("%H%M")<CR>P:w<CR>a·<ESC>
nmap <leader>txl $F·"=strftime("%H%M")<CR>P:s/\s*$//<CR>A - <ESC>:w<CR>
nmap <leader>tsl :s/\s*$//<CR>A (\| because? \|) s:<ESC>"=strftime("%H%M")<CR>p:w<CR>?because<CR>f<SPACE>i<SPACE>
imap <leader>tal <ESC>$T["=strftime("%H%M")<CR>PA - <ESC>:w<CR>
nmap <leader>tal :s/\s*$//<CR>A - (\| reason? \|) a:<ESC>"=strftime("%H%M")<CR>p:w<CR>?reason<CR>f<SPACE>i<SPACE>
imap <leader>tal <ESC>:s/\s*$//<CR>A - (\| reason? \|) a:<ESC>"=strftime("%H%M")<CR>p:w<CR>?reason<CR>f<SPACE>i<SPACE>
nmap <leader>tcl :s/\s*$//<CR>A - (\| comments: \|) c:<ESC>"=strftime("%H%M")<CR>p:w<CR>?comments<CR>f<SPACE>i<SPACE>
nmap <leader>tcl <ESC>:s/\s*$//<CR>A - (\| comments: \|) c:<ESC>"=strftime("%H%M")<CR>p:w<CR>?comments<CR>f<SPACE>i<SPACE>

" (s)ibling t=task, g=goal, q=question, e=event
nmap <leader>tst yyp:s/^\([TONEQG]\)\([ \.]*\).*$/T\2A
nmap <leader>tsg yyp:s/^\([TONEQG]\)\([ \.]*\).*$/G\2A
nmap <leader>tsq yyp:s/^\([TONEQG]\)\([ \.]*\).*$/Q\2A
nmap <leader>tse yyp:s/^\([TONEQG]\)\([ \.]*\).*$/E\2[·30] f[a

" (n)ew t=task, g=goal, q=question, E=event(known start time), e=event(unknown start time)
nmap <leader>tnt G?>>TODO(()OT 
nmap <leader>tng G?>>TODO(()OG 
nmap <leader>tnq G?>>TODO(()OQ 
nmap <leader>tnE G?>>TODO(()OE [·30] <ESC>F[a
nmap <leader>tne G?>>TODO(()OE [·30] <ESC>F[a?<ESC>A

" (f)inish c=complete, a=abandoned, s=suspended

" (s)uspend t=task, g=goal, q=question, e=event
"nmap <leader>tst yyp:s/^\([TONEQG]\)\([ \.]*\).*$/T\2A
"nmap <leader>tsg yyp:s/^\([TONEQG]\)\([ \.]*\).*$/G\2A
"nmap <leader>tsq yyp:s/^\([TONEQG]\)\([ \.]*\).*$/Q\2A
"nmap <leader>tse yyp:s/^\([TONEQG]\)\([ \.]*\).*$/E\2[·30] f[a

" (z) f=fold
nmap <leader>tzf mz$?^(\|<CR>v/^\|)<CR>$zf


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Toneq END

" gf (goto file) such that it will create a new file if it doesn't exist... (http://stackoverflow.com/questions/1050745/unable-to-create-a-file-from-a-path-in-vim)
nmap gf :e <cfile><CR>
nmap gff :e! <cfile><CR>
nmap gfw :w<CR>:e <cfile><CR>
" goto file and re(m)ember ('F goes to file)
nmap gfm mMyyp:s/^\s*\([^\s].*\)$/\1/e<CR>:s/ /\\ /ge<CR>0"aDdd:w<CR>:e <C-r>a<CR>mF`M:let @f=@a<CR>
" goto file and open in new tab
nmap gft mMyyp:s/^\s*\([^\s].*\)$/\1/e<CR>:s/ /\\ /ge<CR>0"aDdd:w<CR>:e <C-r>a<CR>mF`M:tabnew<CR>'F:let @f=@a<CR> 
" goto file in current directory (must save file first)
nmap gf. :e %:p:h/<cfile><CR>

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

" CtrlP setup
"
" for dotfiles and such
let g:ctrlp_show_hidden = 1 
" use regex by default (can switch using <Ctrl+R> (also note <Ctrl-D> for
" switching file/path)
let g:ctrlp_regexp = 1
" see:
" https://github.com/kien/ctrlp.vim/blob/564176f01d7f3f7f8ab452ff4e1f5314de7b0981/doc/ctrlp.txt#L439
" makes so spaces become .*
let g:ctrlp_abbrev = {
    \ 'gmode': 't',
    \ 'abbrevs': [
        \ { 'pattern': ' ', 'expanded': '.*', 'mode': 'pfr', } 
    \ ]
\ } 
" Fuzzy finding short cuts
nmap <leader>f. :CtrlPCurFile<CR>
nmap <leader>f~ :CtrlP ~<CR>
nmap <leader>fd :CtrlP 
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
nmap <leader>_trim_end_ :s/\s\+$//e<CR>
nmap <leader>md= <LEADER>_trim_end_yypv$hr=
nmap <leader>md- <LEADER>_trim_end_yypv$hr-
nmap <leader>mds :silent exe "!md-chrome.sh %"<CR>:redraw!<CR>
nmap <leader>mdsgit :silent exe "!md-chrome.sh % github"<CR>:redraw!<CR>
vmap <leader>mdl "zdi[<C-r>z]()<ESC>i
imap <leader>mdl <ESC>mz?\(^\\|http\\| \)<CR>v`z<LEADER>mdl
nmap <leader>mdl /\([^ ]\\|$\)<CR>a<LEADER>mdl
imap <leader>md= <ESC><LEADER>md=
imap <leader>md- <ESC><LEADER>md- 

nmap <leader>soc <ESC>"=strftime("%A %F - %R")<CR>p
nnoremap <leader>scr :r !today<CR>A/scratch.md<ESC>
nnoremap <leader>today o<ESC>"=strftime("%F")<CR>p
inoremap <leader>today <ESC>"=strftime("%F")<CR>pa
imap <leader>now <ESC>"=strftime("%H%M")<CR>pa
imap <leader>Now <ESC>"=strftime("%R")<CR>pa
imap <leader>NOw <ESC>"=strftime("%F - %R")<CR>pa
imap <leader>NOW <ESC>"=strftime("%A %F - %R")<CR>pa
" recommend <leader>dl (this is more internal)
nmap <leader>later o<ESC>i<CR><ESC>"=". . . " . strftime("%R") . " . . ."<CR>pA<CR><CR><ESC>
nmap <leader>dnew G?^EOF.<CR>(()o<CR><ESC><leader>soc<leader>md=o<CR>
nmap <leader>dnow G?^EOF.<CR>((
nmap <leader>dl G?^EOF.<CR>(()k<leader>latera
nmap <leader>dday :new `now -d`.md<CR>10i<CR><ESC>oEOF.<ESC>gg<leader>soc<leader>md=o<CR>
" footnotes (btw digraph 1S=¹, 2S=², etc.)
imap <leader>fn1 <ESC>mqa¹<ESC>o<CR>[¹: footnote ]<ESC>`qla
nmap <leader>fn1 mqa¹<ESC>o<CR>[¹: footnote ]<ESC>Ffcw
imap <leader>fn2 <ESC>mqa²<ESC>o<CR>[²: footnote ]<ESC>`qla
nmap <leader>fn2 mqa²<ESC>o<CR>[²: footnote ]<ESC>Ffcw
imap <leader>fn3 <ESC>mqa³<ESC>o<CR>[³: footnote ]<ESC>`qla
nmap <leader>fn3 mqa³<ESC>o<CR>[³: footnote ]<ESC>Ffcw
imap <leader>fn4 <ESC>mqa⁴<ESC>o<CR>[⁴: footnote ]<ESC>`qla
nmap <leader>fn4 mqa⁴<ESC>o<CR>[⁴: footnote ]<ESC>Ffcw

let g:session_autoload = 'no'
let g:session_autosave = 'no' 
let g:session_autosave_periodic = 0

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


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

" http://vim.wikia.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally
" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  echo msg
  let @"=reg_saved
endfunction

let g:sparkupNextMapping = '<leader>x'
