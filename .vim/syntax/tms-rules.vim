syn keyword structure rule after on when then else end not
syn keyword ops not == !=
syn match commentline /^\s*#.*$/
syn region conststr start=/"/ end=/"/
syn region conststr_dsl start=/'/ end=/'/
syn region variable start=/\[/ end=/]/

hi def link ops Operator
hi def link conststr String
hi def link conststr_dsl String
hi def link variable Identifier
hi def link commentline Comment
