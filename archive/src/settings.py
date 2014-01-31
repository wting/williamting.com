# -*- coding: utf-8 -*-
AUTHOR = 'William Ting'
EMAIL = 'io at williamting.com'
SITENAME = 'William Ting'
#TAGLINE = 'lame tagline here :)'
SITEURL_PUBLIC = 'http://williamting.com'
SITEURL_LOCAL = 'http://localhost:8000'
TIMEZONE = 'America/Chicago'
DEFAULT_LANG = 'en'
LOCALE = ''
DEFAULT_DATE_FORMAT = ('%b %d, %Y')

THEME = './src/themes/svbtle/'
DEFAULT_CATEGORY = 'misc'
ARTICLE_URL = 'posts/{date:%Y}/{date:%m}/{date:%d}/{slug}/'
ARTICLE_SAVE_AS = 'posts/{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html'
RELATIVE_URLS = False
MARKUP = ['md']

FEED_DOMAIN = SITEURL
# FEED_ATOM = 'feeds/all.atom.xml'
CATEGORY_FEED_ATOM = 'feeds/category.%s.atom.xml'
TAG_FEED_ATOM = 'feeds/tag.%s.atom.xml'

PAGE_DIR = ('pages/')
ARTICLE_DIR = ('posts/')

GOOGLE_ANALYTICS = 'UA-29827268-2'
#DISQUS_SITENAME = 'wting'

LINKS = (
        ('@_wting', 'https://twitter.com/_wting'),
        ('email', 'mailto:william.h.ting at gmail.com'),
        ('github', 'https://github.com/wting'),
        # ('feed', FEED_DOMAIN + '/' + FEED_ATOM),
        )

DEFAULT_PAGINATION = 5
REVERSE_ARCHIVE_ORDER = True
DISPLAY_PAGES_ON_MENU = True

# static paths will be copied under the same name
STATIC_PATHS = [
        'images',
        'images/favicon.ico',
        'robots.txt',
        ]

EXTRA_PATH_METADATA = {
        'robots.txt': {'path': 'robots.txt'},
        'images/favicon.ico': {'path': 'favicon.ico'},
        }
