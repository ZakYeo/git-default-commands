#!/bin/bash
git config --global alias.checkout-default '!f() { \
  default_branch=$(git remote show origin | grep "HEAD branch" | awk "{print \$NF}"); \
  git checkout $default_branch; \
}; f'
