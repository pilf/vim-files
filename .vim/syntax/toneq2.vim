
" there is some trouble with the order these are introduced.  Not sure exactly
" reason but if you only have 1 of the following it will work
syn include @RUST syntax/rust.vim
syn include @MD syntax/markdown.vim
"syn include @SH syntax/sh.vim


syn match tqDaySep /^\d\d\d\d-\d\d-\d\d/
" {-} is non-greedy *
syn match tqLine /^[ONG][ .]*\s*\(\[.\{-}\]\)\?/
syn match tqActiveLine /^[TEQ][ .]*\s*\(\[.\{-}\]\)\?/

"syn region tqNoteEx matchgroup=TExSnip start=/(|ex\s*$/ end=/|)/ contains=@ELIXIR
"syn region tqNoteSh matchgroup=TShSnip start=/(|sh\s*$/ end=/|)/ contains=sh
"syn region tqNoteRs matchgroup=TRustSnip start=/(|rs\s*$/ end=/|)/ contains=@RUST

syn region tqNote start=/^(.*|/ end=/^|)/ 
syn region tqNoteMd matchgroup=TMdSnip start=/^(\s*md\s*|/ end=/|)/ contains=@MD keepend
syn region tqNoteRs matchgroup=TRustSnip start=/^(\s*\(rs\|rust\)\s*|/ end=/|)/ contains=@RUST keepend
"syn region tqNoteSh matchgroup=TShSnip start=/^(\s*sh\s*|/ end=/|)/ contains=@SH keepend

syn match tqComplete /^[TONEQG].*∷.*[ca]:\s*\~\?\s*\([0-9]\{4,4}\(\s*[ٍ±‥+-]\s*[0-9]\{1,4}\)\?\)\?\((.*)\)\?\(?\s*".*"\)\?\s*$/
syn match tqSuspended /∷.*s:\s*\~\?\s*\([0-9]\{4,4}\(\s*[ٍ±‥+-]\s*[0-9]\{1,4}\)\?\)\?\((.*)\)\?\(\s*·[^?]*\)\?\(?\s*".*"\)\?\s*$/
syn match tqImportant /\[!\].*$/
syn match tqInProgress /∷.*-\s*$/
syn match tqLineNote /^[|¦][^)].*$/
"syn match tqTest /^|.*/

hi def link tqDaySep Statement
hi def link tqLine Operator 
"hi def link tqEvent Operator 
"hi def link tqSet Operator 

"probably 'better' but ignore is too harsh
"hi def link tqNote Comment
"hi def link tqLineNote Comment
"hi def link tqComplete Ignore
hi def link tqNote SpecialComment
hi def link tqLineNote SpecialComment
hi def link tqComplete Comment

hi def link tqImportant Underlined
hi def link tqInProgress Underlined
hi def link tqSuspended Error
hi def link tqActiveLine Constant

"hi def link TExSnip elixir
"hi def link TRustSnip rust
"hi def link TShSnip sh
"hi def link TMdSnip markdown
