config.load_autoconfig()
c.url.searchengines = { 
        'DEFAULT': 'https://google.com/search?q={}',
        'd': 'https://duckduckgo.com/?q={}',
        'a': 'https://www.amazon.co.uk/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords={}',
        'imdb': 'https://www.imdb.com/find?q={}',
        'g': 'https://www.google.co.uk/search?q={}' }
