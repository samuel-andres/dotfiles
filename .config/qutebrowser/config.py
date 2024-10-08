# ##----------------- LINTING ----------------------## #
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401,E501 pylint: disable=unused-import
from qutebrowser.config.config import ConfigContainer  # noqa: F401,E501 pylint: disable=unused-import
config = config  # type: ConfigAPI # noqa: F821 pylint: disable=E0602,C0103
c = c  # type: ConfigContainer # noqa: F821 pylint: disable=E0602,C0103

# ##-------------- DISABLE UI CONFIG ---------------## #
config.load_autoconfig(False)

# ## ----------------- DOWNLOADS -------------------## #
c.downloads.location.directory = "~/Downloads"

# ## ------------------ MEDIA ----------------------## #
c.content.autoplay = False

# ##------------------ UNFOCUS ---------------------## #
config.bind('<Escape>', 'jseval -q document.activeElement.blur()')

# ##-------------------- UI ------------------------## #
c.tabs.position = "top"
c.scrolling.bar = "never"
c.content.fullscreen.window = True
c.statusbar.show = "in-mode"
c.tabs.show = "multiple"

# ##------------------- PAGES ----------------------## #
# new tab
c.url.default_page = "file:///home/"
# open browser
c.url.start_pages = ["file:///home/"]

# ##------------------ SEARCH ----------------------## #
c.url.searchengines = {
    "DEFAULT":  "https://www.google.fi/search?q={}",
    "dg":      "https://duckduckgo.com/?q={}",
    "yt":       "https://www.youtube.com/results?search_query={}",
    "gh":       "https://github.com/search?q={}",
    "rd":       "https://www.reddit.com/r/{}",
    "tw":       "https://twitter.com/search?q={}",
}

# ##------------------ SESSION ---------------------## #
c.auto_save.session = False
c.session.lazy_restore = True

# ##----------------- BOOKMARKS --------------------## #
config.bind('tw', ':open --tab https://twitter.com')
config.bind('rd', ':open --tab https://reddit.com')
config.bind('gh', ':open --tab https://github.com')
config.bind('yt', ':open --tab https://youtube.com')
config.bind('ww', ':open --tab https://web.whatsapp.com')
config.bind('gm', ':open --tab https://mail.google.com')
config.bind('lb', ':open --tab https://letterboxd.com')

# ##----------------- CLIPBOARD ------------------## #
c.content.javascript.clipboard = "access-paste"

config.source("gruvbox.py")
