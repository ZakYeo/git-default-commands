git config --global alias.merge-default '!f() { \
  default_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@"); \
  git merge origin/$default_branch; \
}; f'
