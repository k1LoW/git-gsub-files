# git-gsub-files [![Gem](https://img.shields.io/gem/v/git-gsub-files.svg)](https://rubygems.org/gems/git-gsub-files) [![Travis](https://img.shields.io/travis/k1LoW/git-gsub-files.svg)](https://travis-ci.org/k1LoW/git-gsub-files)

A Git subcommand to `mv` file like gsub in a repository

## Usage

```sh
$ git gsub-files READ WRITE
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
(use "git add/rm <file>..." to update what will be committed)
(use "git checkout -- <file>..." to discard changes in working directory)

deleted:    README.md

Untracked files:
(use "git add <file>..." to include in what will be committed)

WRITEME.md

no changes added to commit (use "git add" and/or "git commit -a")
```

### `--add` option

Run `git mv` instead of `mv`.

```sh
$ git gsub-files READ WRITE --add
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
(use "git reset HEAD <file>..." to unstage)

renamed:    README.md -> WRITEME.md

no changes added to commit (use "git add" and/or "git commit -a")
```

## Instration

    $ gem install git-gsub-files

## See also

- [git-gsub](https://github.com/fujimura/git-gsub) A Git subcommand to do gsub in a repository
- [git-rename](https://github.com/fujimura/dotfiles/blob/master/bin/git-rename)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/git-gsub-files/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
