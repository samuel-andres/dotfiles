# ##----------------- LINTING ----------------------## #
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401,E501 pylint: disable=unused-import
from qutebrowser.config.config import ConfigContainer  # noqa: F401,E501 pylint: disable=unused-import
config = config  # type: ConfigAPI # noqa: F821 pylint: disable=E0602,C0103
c = c  # type: ConfigContainer # noqa: F821 pylint: disable=E0602,C0103

# ##-------------- DISABLE UI CONFIG ---------------## #
config.load_autoconfig(False)

# ##--------------- FILE MANAGER -------------------## #
config.set("fileselect.handler", "external")
config.set(
    "fileselect.single_file.command",
    ['st', '-c', 'Ranger', '-e', 'ranger', '--choosefile', '{}']
)
config.set(
    "fileselect.multiple_files.command",
    ['st', '-c', 'Ranger', '-e', 'ranger', '--choosefiles', '{}']
)

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
c.url.default_page = "about:blank"
# open browser
c.url.start_pages = ["about:blank"]

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

# ##------------------ ALIASES ---------------------## #
c.aliases = {
    **c.aliases,
    # open current yt video in mpv
    "mpv": "spawn --userscript ~/.config/qutebrowser/userscripts/view_in_mpv",
}

# ##----------------- BOOKMARKS --------------------## #
config.bind('tw', ':open --tab https://twitter.com')
config.bind('rd', ':open --tab https://reddit.com')
config.bind('gh', ':open --tab https://github.com')
config.bind('yt', ':open --tab https://youtube.com')
config.bind('ww', ':open --tab https://web.whatsapp.com')
config.bind('gm', ':open --tab https://mail.google.com')
config.bind('lb', ':open --tab https://letterboxd.com')
