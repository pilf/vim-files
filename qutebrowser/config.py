# Autogenerated config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}

# Turn on Qt HighDPI scaling. This is equivalent to setting
# QT_AUTO_SCREEN_SCALE_FACTOR=1 or QT_ENABLE_HIGHDPI_SCALING=1 (Qt >=
# 5.14) in the environment. It's off by default as it can cause issues
# with some bitmap fonts. As an alternative to this, it's possible to
# set font sizes and the `zoom.default` setting.
# Type: Bool
c.qt.highdpi = True

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Allow websites to request geolocations.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.geolocation', False, 'https://www.hermanmiller.com')

# Allow websites to lock your mouse pointer.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.mouse_lock', True, 'https://lovr.org')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://captchareverse.com')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://epoznan.pl')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://ibb.co')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://index-au.com')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://new.reddit.com')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://patch.com')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://www.accuweather.com')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://www.ghacks.net')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://www.javatpoint.com')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://www.reddit.com')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', False, 'https://www.reporter.am')

# Allow websites to register protocol handlers via
# `navigator.registerProtocolHandler`.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.register_protocol_handler', False, 'https://mail.google.com?extsrc=mailto&url=%25s')

# Execute the best-matching command on a partial match.
# Type: Bool
c.completion.use_best_match = True

# Editor (and arguments) to use for the `edit-*` commands. The following
# placeholders are defined:  * `{file}`: Filename of the file to be
# edited. * `{line}`: Line in which the caret is found in the text. *
# `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['/Applications/MacVim.app/Contents/bin/gvim', '-g', '-f', '{file}', '-c', 'normal {line}G{column0}l']

# Duration (in milliseconds) to ignore normal-mode key bindings after a
# successful auto-follow.
# Type: Int
c.hints.auto_follow_timeout = 300

# Dictionary file to be used by the word hints.
# Type: File
c.hints.dictionary = '$HOME/.qutebrowser/words'

# Mode to use for hints.
# Type: String
# Valid values:
#   - number: Use numeric hints. (In this mode you can also type letters from the hinted element to filter and reduce the number of elements that are hinted.)
#   - letter: Use the characters in the `hints.chars` setting.
#   - word: Use hints words based on the html elements and the extra words.
c.hints.mode = 'word'

# Duration (in milliseconds) to show messages in the statusbar for. Set
# to 0 to never clear messages.
# Type: Int
c.messages.timeout = 10000

# When/how to show the scrollbar.
# Type: String
# Valid values:
#   - always: Always show the scrollbar.
#   - never: Never show the scrollbar.
#   - when-searching: Show the scrollbar when searching for text in the webpage. With the QtWebKit backend, this is equal to `never`.
#   - overlay: Show an overlay scrollbar. On macOS, this is unavailable and equal to `when-searching`; with the QtWebKit backend, this is equal to `never`. Enabling/disabling overlay scrollbars requires a restart.
c.scrolling.bar = 'always'

# When to show the statusbar.
# Type: String
# Valid values:
#   - always: Always show the statusbar.
#   - never: Always hide the statusbar.
#   - in-mode: Show the statusbar when in modes other than normal mode.
c.statusbar.show = 'never'

# How to behave when the last tab is closed. If the
# `tabs.tabs_are_windows` setting is set, this is ignored and the
# behavior is always identical to the `close` value.
# Type: String
# Valid values:
#   - ignore: Don't do anything.
#   - blank: Load a blank page.
#   - startpage: Load the start page.
#   - default-page: Load the default page.
#   - close: Close the window.
c.tabs.last_close = 'blank'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'switching'

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`). * `{0}` means the same as `{}`, but can be used
# multiple times.  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}', 'd': 'https://duckduckgo.com/?q={}', 'a': 'https://www.amazon.co.uk/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords={}', 'imdb': 'https://www.imdb.com/find?q={}', 'g': 'https://www.google.co.uk/search?q={}', 'story': 'https://dev.azure.com/guestlinelabs/Rezlynx/_workitems/edit/{}', 'youtube': 'https://www.youtube.com/results?search_query={}' }

# Default zoom level.
# Type: Perc
c.zoom.default = '125%'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(255, 247, 133, 1.0), stop:1 rgba(255, 66, 66, 1.0))'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#202060'

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = 'black'

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
c.colors.webpage.bg = 'black'

# Render all web contents using a dark theme. Example configurations
# from Chromium's `chrome://flags`:  - "With simple HSL/CIELAB/RGB-based
# inversion": Set   `colors.webpage.darkmode.algorithm` accordingly.  -
# "With selective image inversion": Set
# `colors.webpage.darkmode.policy.images` to `smart`.  - "With selective
# inversion of non-image elements": Set
# `colors.webpage.darkmode.threshold.text` to 150 and
# `colors.webpage.darkmode.threshold.background` to 205.  - "With
# selective inversion of everything": Combines the two variants   above.
# Type: Bool
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = 'never'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '16pt default_family'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'bold 16pt default_family'

# Font used for the hints.
# Type: Font
c.fonts.hints = 'bold 18pt default_family'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = '16pt default_family'

# Bindings for normal mode
config.bind('<Ctrl+w>', 'rl-backward-kill-word')

# Bindings for command mode
config.bind('<Ctrl+w>', 'rl-backward-kill-word', mode='command')

c.content.javascript.clipboard = 'access'
