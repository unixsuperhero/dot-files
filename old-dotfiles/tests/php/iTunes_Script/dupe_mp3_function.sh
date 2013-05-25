itunesclear() { find "/Users/jearsh/Music/iTunes/iTunes Music" -iname '*1.*' -exec dirname {} \; | sort -u; }
