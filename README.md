Chris Barna's Dotfiles
=============================
These are files to configure a shell just the way I like it. Most of the
configuration comes from [sferik](https://github.com/sferik/dotfiles)
but I have made a fair amount of changes.

Main Changes
------------
* `vimrc.local` instead of `vimrc` because I am using
  [Janus](https://github.com/carlhuda/janus)
* `gitignore_global`

Installation
------------
    git clone git://github.com/sferik/dotfiles
    cd dotfiles
    bundle install
    bundle exec thor dotfiles:install

Inspiration
-----------
These files are an amalgamation of wisdom Erik collected over the years,
the sources of which are too numerous to list. The idea to put them in a
repository with an install script was taken from [Ryan
Bates](https://github.com/ryanb/dotfiles).
