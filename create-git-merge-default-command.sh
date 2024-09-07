#!/bin/bash
git config --global alias.merge-default '!f() { \
  default_branch=$(git remote show origin | grep "HEAD branch" | awk "{print \$NF}"); \
  git merge origin/$default_branch; \
}; f'
