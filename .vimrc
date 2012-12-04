" Update: looks like this is a simpler way to do it, reload current file:
"   :so %
" Reload source with:
"   :source $MYVIMRC
" Can also view location of vimrc with
"   :echo $MYVIMRC

if has("gui_running")
    set guioptions=egmrt
endif

colorscheme ir_black
syntax on
set t_Co=256
set background=dark

set shiftwidth=4
set sts=4
set et
set autoindent

set scrolloff=4

set clipboard=unnamed

set wildchar=<Tab> wildmenu wildmode=full

nnoremap <CR> o<ESC>
nnoremap <S-CR> O<ESC>

nnoremap ,r q:?s\/<CR><CR>
nmap ,h :set invlist<CR>
nmap ,b :ls<CR>:buffer<Space>
nmap ,ln :set nu!<CR>
nnoremap <Space> 10jzz
nnoremap <S-Space> 10kzz

nmap ,pythis :set makeprg=python\ %<CR>:make<CR>
nmap ,wpythis :w<CR>:set makeprg=python\ %:p<CR>:make<CR>

function! Pythis()
    :echo "to execute, use the following\n:call Pythis()"
endfunction

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

