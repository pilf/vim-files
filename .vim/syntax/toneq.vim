syn match tqDaySep /^\d\d\d\d-\d\d-\d\d/
syn match tqTask /^[TQG][ .]*/
syn match tqEvent /^E[ .]*\[[0-9:]*\]/
syn match tqSet /^S[ .]*\[[0-9:]*\]/
syn region tqNote start=/(|/ end=/|)/

hi def link tqDaySep Statement
hi def link tqTask Operator 
hi def link tqEvent Operator 
hi def link tqSet Operator 
hi def link tqNote Comment

