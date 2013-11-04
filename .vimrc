set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

syntax on
set t_Co=256
set background=dark

" http://archive09.linux.com/feature/120126
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

if $TERM != 'xterm-256color'
    colorscheme elflord
else
    colorscheme distinguished
endif

if has("gui_running")
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
    if $living_room!=""
        let mapleader = "<"
    else
        let mapleader = "§"
    endif
endif

function! CdToThis()
    exe ":cd %:p:h"
endfunction
com! CdToThis call CdToThis()

set viminfo='100,<500,s10,h,!

" Tabs etc
set shiftwidth=4
set sts=4
set tabstop=4
set et
set autoindent
nnoremap <leader>tt :set noet<CR>:retab!<CR>

nnoremap <leader>tnx :set noet
nnoremap <leader>tx :set et
nnoremap <leader>t2 :set shiftwidth=2<CR>:set tabstop=2<CR>:set sts=2<CR>
nnoremap <leader>t4 :set shiftwidth=4<CR>:set tabstop=4<CR>:set sts=4<CR>

set lbr

" will automatically update file if changed externally (supressing W11 error)
set autoread

set scrolloff=6
set wildmode=longest,list,full
set wildmenu
"set wildchar=<Tab>
set completeopt=menu,longest

" http://vim.wikia.com/wiki/Backspace_and_delete_problems
" set backspace=2

set encoding=utf-8

set wildmode=longest:full

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:›\ ,eol:¬,trail:·
" Invisible character colors
highlight NonText guifg=#4a4a59  guibg=NONE
highlight SpecialKey guifg=#4a4a59 guibg=NONE

map Y y$

" re-assign "* to p
nmap <leader>p :let @p=@*<CR>

" alternative for newlining
nmap <leader>o myo<ESC>`y
nmap <leader>O myO<ESC>`y

nmap <leader>hs :set list!<CR>
nmap <leader>b :ls<CR>:buffer<Space>
nmap <leader>ln :set nu!<CR>
"(note) To insert the elipsis, press ctrl-vu followed by the numeric code for elipsis: 2026
nmap <leader>sb :set showbreak=…<CR>

" copying my path seems to be something I do quite a bit so here's
" two handy commands, the first echo the current file whilst in insert mode
" old way (inserts new line) inoremap <leader>cp <ESC>:put =expand('%:p')<CR>
inoremap <leader>cp <C-r>=expand('%:p')<CR>
" in normal mode this copies it into the "p register
nnoremap <leader>cp "=expand("%:p")<CR>:let @p=@%<CR>

nnoremap <leader>r q:?s\/<CR><CR>
nmap <leader>mg :w<CR>:Shell gc % \| mongo<CR>:set syntax=javascript<CR>
nmap <leader>mt :w<CR>:Shell gc % \| mongo 192.168.10.71:27017<CR>:set syntax=javascript<CR>
"autocmd VimEnter * SessionOpenLast
nnoremap <leader>a :%y+<CR>

" insert (crude snippets)
"inoremap <leader>pi <ESC>"='\|> '<CR>pyiw==a
inoremap <leader>pi \|><Space>
"inoremap <leader><leader> <leader>

"resizing stuff 

" Toneq stuff
nnoremap <leader>tsx :set syntax=toneq<CR>
nnoremap <leader>tin A<Space>(<BAR><Space><Space><BAR>)<esc>2hi
nnoremap <leader>ton o(<BAR><CR><CR><BAR>)<esc>ki

" gf (goto file) such that it will create a new file if it doesn't exist... (http://stackoverflow.com/questions/1050745/unable-to-create-a-file-from-a-path-in-vim)
:nmap gf :e <cfile><CR>
:nmap gff :e! <cfile><CR>
:nmap g% :e %:p:h/<cfile><CR>

set clipboard=unnamed

" Fuzzy finding short cuts
nmap <leader>f. :FufFileWithCurrentBufferDir<CR>
nmap <leader>ff :FufFile **/<CR>
nmap <leader>fb :FufBuffer<CR>

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

command! Copyfile let @*=substitute(expand("%:p"), '/', '\', 'g')
:nnoremap <Leader>cf :Copyfile<CR>

:nmap <leader>soc "=strftime("%A %F - %R")<CR>p
:nmap <leader>scr :!today<CR><CR>"=expand("~/tmp/") . strftime("%Y") . "/" . strftime("%Y%m") . "/" . strftime("%Y%m%d") . "/scratch.txt"<CR>p
:nmap <leader>today "=strftime("%F")<CR>p
:nmap <leader>later i<CR><ESC>"=". . . " . strftime("%R") . " . . ."<CR>pA<CR><CR><ESC>

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

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" this doesn't really seem to work so well, but interesting -- perhaps could
" launch Araxis maybe.
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
