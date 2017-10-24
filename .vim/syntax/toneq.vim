
syn include @ELIXIR syntax/elixir.vim
" there is some trouble with the order these are introduced.  Not sure exactly
" reason but if you only have 1 of the following it will work
"syn include @SH syntax/sh.vim
"syn include @RUST syntax/rust.vim
syn include @MD syntax/markdown.vim


syn match tqDaySep /^\d\d\d\d-\d\d-\d\d/
syn match tqTask /^[TQG][ .]*/
syn match tqEvent /^E[ .]*\[[0-9·:]*\]/
syn match tqSet /^S[ .]*\[[0-9:]*\]/

syn region tqNoteMd matchgroup=TMdSnip start=/(|md\s*$/ end=/|)/ contains=@MD
syn region tqNoteEx matchgroup=TExSnip start=/(|ex\s*$/ end=/|)/ contains=@ELIXIR
syn region tqNoteSh matchgroup=TShSnip start=/(|sh\s*$/ end=/|)/ contains=sh
syn region tqNoteRs matchgroup=TRustSnip start=/(|rs\s*$/ end=/|)/ contains=@RUST

syn region tqNote start=/(|\s*$/ end=/|)/ 

syn match tqComplete /^[TQGE].*-\s*[ca]:\(?\|\~\?[0-9]\{1,4}\)\s*\((|.*|)\)\?\s*$/ 
syn match tqImportant /\[!\].*$/

hi def link tqDaySep Statement
hi def link tqTask Operator 
hi def link tqEvent Operator 
hi def link tqSet Operator 
hi def link tqNote Comment
hi def link tqComplete Comment
hi def link tqImportant Underlined

hi def link TExSnip elixir
hi def link TRustSnip rust
hi def link TShSnip sh
hi def link TMdSnip markdown
