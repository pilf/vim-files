vimdiff cheatsheet
------------------
do - Get changes from other window into the current window.  
dp - Put the changes from current window into the other window.  
]c - Jump to the next change.  
[c - Jump to the previous change.  
:diffthis               - start diff when :e/:new etc.
:diffoff                - diff off
:set diffopt+=iwhite    - ignore whitespace
:set diffopt-=iwhite    - whitespace compare on
zm/zr/zR/zo/zO/zc/zC    - fold operations (make/remove/remove all/open/open all/close/close all)
