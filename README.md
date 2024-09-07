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

---

## Git Alias: Checkout Default Branch

### Description

Similar to `merge-default`, this alias (`checkout-default`) simplifies the process of checking out the default branch, regardless of whether it's `main`, `master`, or a custom name. It dynamically detects the default branch set in the repository's origin using the same method and checks it out with a single command.

### Installation

To install this alias, run the following command:

```sh
git config --global alias.checkout-default '!f() { \
  default_branch=$(git remote show origin | grep "HEAD branch" | awk "{print \$NF}"); \
  git checkout $default_branch; \
}; f'
```

### Usage

Once the alias is configured, you can use it by simply running:

```sh
git checkout-default
```

This command will:
1. Automatically detect the default branch (typically `main` or `master`).
2. Switch your working directory to the default branch.

### Why This Helps

1. **Fast switching**: It eliminates the need to remember the default branch name across different repositories, allowing you to quickly switch to the default branch regardless of its name.
  
2. **Consistency**: If you're working in multiple repositories with different branch names, this alias makes switching back to the default branch consistent.

### Example

Normally, to switch to the default branch, you would have to check the name and run either:

```sh
git checkout main
```
or

```sh
git checkout master
```

With `checkout-default`, you just need to run:

```sh
git checkout-default
```

This command will automatically check out the correct default branch based on the repository's configuration.

### Notes

- This command assumes you have the `origin` remote properly configured and pointing to the correct repository.
