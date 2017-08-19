# Fedora doesn't seems to set this value by default
export BROWSER=google-chrome

# search Google from command line
# gg term1 term2 termN
# @see http://superuser.com/a/47216
gg() {
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    sensible-browser "https://www.google.com/search?q=$search"
}

# search Google Bookmark from command line
# gb term1 term2 termN
gb() {
    search=""
    echo "Search Google Bookmark: $@"
    for term in $@; do
        search="$search+$term"
    done
    sensible-browser "https://www.google.com/bookmarks/find?q=$search"
}
