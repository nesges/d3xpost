class DefaultConfig(object):
    DEBUG = False
    DEVELOPMENT = False
    TESTING = False
    CSRF_ENABLED = True
    SECRET_KEY = 'bb0dfbbecacc26da9abd2a4d6e0990925471c28be59eebbed68d5fbcdf378fab'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    # SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://moa:moa@localhost/moa'
    SQLALCHEMY_DATABASE_URI = 'sqlite:///moa.db'
    TWITTER_CONSUMER_KEY = ''
    TWITTER_CONSUMER_SECRET = ''
    INSTAGRAM_CLIENT_ID = ''
    INSTAGRAM_SECRET = ''
    
    SEND = True
    SENTRY_DSN = None
    HEALTHCHECKS = []
    MAIL_SERVER = None
    MAIL_PORT = 587
    MAIL_USE_TLS = True
    MAIL_USERNAME = ''
    MAIL_PASSWORD = ''
    MAIL_TO = ''
    MAIL_DEFAULT_SENDER = ''
    MAX_MESSAGES_PER_RUN = 5

    # This option prevents Twitter replies and mentions from occuring when a toot contains @user@twitter.com. This
    # behavior is against Twitter's rules.
    SANITIZE_TWITTER_HANDLES = True

    SEND_DEFERRED_EMAIL = False
    SEND_DEFER_FAILED_EMAIL = False
    MAINTENANCE_MODE = False

    STATS_POSTER_BASE_URL = None
    STATS_POSTER_ACCESS_TOKEN = None

    TRUST_PROXY_HEADERS = False

    TWITTER_BLACKLIST = []
    MASTODON_BLACKLIST = []
    WORKER_JOBS = 1
    
    MOA_APP_NAME = 'D3Xpost'
    MOA_APP_URL = 'https://xpost.dnddeutsch.de'
    XPOST_SUFFIX = '#xpost'