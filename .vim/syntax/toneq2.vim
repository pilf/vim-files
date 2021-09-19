
" there is some trouble with the order these are introduced.  Not sure exactly
" reason but if you only have 1 of the following it will work
syn include @RUST syntax/rust.vim
syn include @MD syntax/markdown.vim
syn include @SH $VIMRUNTIME/syntax/sh.vim
syn include @JS $VIMRUNTIME/syntax/javascript.vim


syn match tqDaySep /^\d\d\d\d-\d\d-\d\d/
" {-} is non-greedy *
syn match tqNoteLine /^N[ .]*\s*\(\[.\{-}\]\)\?/
syn match tqGoalLine /^[OG][ .]*\s*\(\[.\{-}\]\)\?.*\($\|\ze∷\)/
syn match tqActiveLine /^[TEQ][ .]*\s*\(\[.\{-}\]\)\?/

"syn region tqNoteEx matchgroup=TExSnip start=/(|ex\s*$/ end=/|)/ contains=@ELIXIR
"syn region tqNoteSh matchgroup=TShSnip start=/(|sh\s*$/ end=/|)/ contains=sh
"syn region tqNoteRs matchgroup=TRustSnip start=/(|rs\s*$/ end=/|)/ contains=@RUST

syn region tqNote start=/^(.*|/ end=/^|)/ keepend fold
syn region tqNoteMd matchgroup=TMdSnip start=/^(\s*md\s*|/ end=/|)/ contains=@MD keepend fold
syn region tqNoteRs matchgroup=TRustSnip start=/^(\s*\(rs\|rust\)\s*|/ end=/|)/ contains=@RUST keepend fold
syn region tqNoteSh matchgroup=TShSnip start=/^(\s*sh\s*|/ end=/|)/ contains=@SH keepend fold
syn region tqNoteSh matchgroup=TShSnip start=/^(\s*json\s*|/ end=/|)/ contains=@JS fold keepend fold

syn match tqComplete /^[TONEQG].*∷.*[cam]:\s*\~\?\s*\([0-9]\{4,4}\(\s*[ٍ±‥+-]\s*[0-9]\{1,4}\)\?\)\?\((.*)\)\?\(?\s*".*"\)\?\s*$/
syn match tqSuspended /∷.*s:\s*\~\?\s*\([0-9]\{4,4}\(\s*[ٍ±‥+-]\s*[0-9]\{1,4}\)\?\)\?\((.*)\)\?\(\s*·[^?]*\)\?\(?\s*".*"\)\?\s*$/
syn match tqImportant /\[!\].*$/
syn match tqInProgress /∷.*-\s*$/
syn match tqLineNote /^[|¦][^)].*$/
syn match tqLineNoteRs /^¦rs|.*$/ contains=@RUST keepend
syn match tqLineNoteMd /^¦md|.*$/ contains=@MD keepend
"syn match tqTest /^|.*/

hi def link tqDaySep Statement
hi def link tqNoteLine Operator 
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
hi def link tqGoalLine Operator
