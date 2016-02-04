syn match commentline /#.*$/
syn match date / [0-9TZ:-]* /
syn match sqitchtag /^@[v0-9.]*/
syn match sqitchname /^[A-Za-z_]*/

hi def link sqitchtag Operator
hi def link sqitchname String
hi def link date Identifier
hi def link commentline Comment
