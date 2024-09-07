# Git Alias: Merge Default Branch

## Description

This Git alias (`merge-default`) is a custom command designed to simplify the process of merging the default branch (usually `main` or `master`) into your current working branch. It automatically detects the default branch set for the repository’s origin using `git remote show` and merges it without requiring manual input. This saves time, especially in cases where the default branch name varies across repositories, and ensures that your current branch is always up-to-date with the latest changes from the default branch.

## Installation

To install this alias, you can run the following command directly:

```sh
git config --global alias.merge-default '!f() { \
  default_branch=$(git remote show origin | grep "HEAD branch" | awk "{print \$NF}"); \
  git merge origin/$default_branch; \
}; f'
```

Alternatively, you can clone this repository into your local directory, then make the `.sh` file executable and execute it:

```sh
chmod +x create-git-merge-default-command.sh
./create-git-merge-default-command.sh
```

This will add the `merge-default` alias to your global Git configuration.

## Usage

Once the alias is configured, you can use it by simply running:

```sh
git merge-default
```

This command will:
1. Automatically detect the default branch (typically `main` or `master`), based on the output of `git remote show origin`.
2. Merge the default branch into your current branch.

## Why This Helps

1. **Consistency across repositories**: Many projects use different names for their default branches (e.g., `main`, `master`, or custom names). This alias ensures that you don’t have to manually specify the branch name each time.
  
2. **Save time and avoid errors**: By automatically detecting the default branch, this command helps prevent mistakes and saves you from manually typing the branch name every time you want to merge.

3. **Workflow efficiency**: If you frequently rebase or merge changes from the default branch, this alias allows for a more seamless and automated workflow.

## Example

Let's say you're working on a feature branch and want to ensure you're up-to-date with the latest changes on the default branch. Normally, you'd have to figure out the default branch name and run:

```sh
git merge origin/main
```
or

```sh
git merge origin/master
```

With `git merge-default`, this process becomes automatic. Just run:

```sh
git merge-default
```

And the default branch will be merged into your current branch without needing to know its name in advance.

## Notes

- This command assumes you have the `origin` remote properly configured and pointing to the correct repository.
- It works by querying the remote’s default branch with `git remote show origin`. If no default branch is configured, or if the remote isn’t correctly set, the command may fail.
