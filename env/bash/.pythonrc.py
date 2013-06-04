import readline
import rlcompleter
readline.parse_and_bind("bind '\t' rl_complete")
#if 'libedit' in readline.__doc__:
#    print 'doing this one'
#    readline.parse_and_bind("bind ^I rl_complete")
#else:
#    print 'no, I''m doing it'
#    readline.parse_and_bind("tab: complete")
