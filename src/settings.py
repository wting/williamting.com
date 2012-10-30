# -*- coding: utf-8 -*-
AUTHOR = 'William Ting'
EMAIL = 'william.h.ting at gmail.com'
SITENAME = 'William Ting'
#TAGLINE = 'does stuff the hard way'
#SITEURL = 'http://blog.williamting.com'
SITEURL = 'http://localhost:8000'
TIMEZONE = 'America/Chicago'
DEFAULT_LANG = 'en'
LOCALE = ''
DEFAULT_DATE_FORMAT = ('%b %d, %Y')

#THEME = 'notmyidea'
THEME = './src/themes/svbtle/'
DEFAULT_CATEGORY = 'default'
ARTICLE_URL = 'posts/{date:%Y}/{date:%m}/{date:%d}/{slug}/'
ARTICLE_SAVE_AS = 'posts/{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html'
RELATIVE_URLS = False
MARKUP = 'md'

FEED_DOMAIN = SITEURL
FEED = 'feeds/all.atom.xml'
CATEGORY_FEED = 'feeds/category.%s.atom.xml'
TAG_FEED = 'feeds/tag.%s.atom.xml'

PAGE_DIR = ('pages/')
ARTICLE_DIR = ('posts/')

GOOGLE_ANALYTICS = 'UA-29827268-2'
#DISQUS_SITENAME = 'wting'

LINKS = (
        ('@_wting', 'https://twitter.com/_wting'),
        ('email', 'mailto:william.h.ting at gmail.com'),
        ('github', 'https://github.com/wting'),
        ('feed', FEED_DOMAIN + '/' + FEED),
        )

DEFAULT_PAGINATION = 5
REVERSE_ARCHIVE_ORDER = True
DISPLAY_PAGES_ON_MENU = True

# static paths will be copied under the same name
STATIC_PATHS = ["images", ]

# A list of files to copy from the source to the destination
FILES_TO_COPY = (
        ('robots.txt', 'robots.txt'),
        ('images/favicon.ico','favicon.ico'),
        )
