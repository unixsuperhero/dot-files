function commits_in_b_not_in_a
  if test (count $argv) -gt 1
    git cherry -v $argv[1] $argv[2] | grep -C1 '^[+]' | uniq | sed -E 's/^--//;s/^(.{9})[^[:space:]]+/\1/'
  else
    git cherry -v $argv[1] | grep -C1 '^[+]' | uniq | sed -E 's/^--//;s/^(.{9})[^[:space:]]+/\1/'
  end
end
