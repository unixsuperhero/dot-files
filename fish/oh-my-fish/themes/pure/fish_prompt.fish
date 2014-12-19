# name: Pure
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l gray "\e[0;30m"
  set -l clear "\e[0;0m"
  set -l normal (set_color normal)

  if test $last_status = 0
      set arrow "$green❯ "
  else
      set arrow "$red❯ "
  end
  set -l cwd $cyan(prompt_pwd)

  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)
    set git_info "$git_branch"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow *"
      set git_info "$git_info$dirty"
    end
  end

  echo
  printf "$cwd \e[0;30m$git_info \e[0;0m"
  echo
  echo -n -s $arrow $normal ''
end

