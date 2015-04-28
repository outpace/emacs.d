# .emacs.d

This is an .emacs.d directory that mostly uses
[emacs-starter-kit](https://github.com/technomancy/emacs-starter-kit)
packages for an initial reasonable starting point with some tweaks on
top of that. This repository is designed to use, but it does not
require, [homeshick](https://github.com/andsens/homeshick).

## Changing

Editor configurations can be a fairly personal thing. Changing
setting globally can be at a surprising and disruptive.

It is recommended that you test out new changes in a system specific
configuration and after vetting open a pull request if it seems like
something useful to add to the global configuration.

## Installation

### Emacs

You can build the very latest version of emacs from source with Homebrew as follows:

    brew uninstall emacs
    
If you have a previous installation of emacs (from Homebrew) you may also need to blow away a cached version of the source:

    rm /Library/Caches/Homebrew/emacs-*.tar.gz
    
Then...

    brew install emacs --cocoa --HEAD
    brew linkapps

### emacs.d

#### Using homeshick

    git clone https://github.com/outpace/emacs.d ~/.homeshick/repos/emacs.d
    homeshick link emacs.d

#### Without homeshick

    git clone https://github.com/outpace/emacs.d ~/emacs.d
    ln -s ~/emacs.d/home/.emacs.d ~/.emacs.d


## Interesting bits

This project loads system specific emacs lisp files both at the
beginning and end of evaluation `init.el`. This allows a user to
override or set up their own custom configuration independently of the
main configuration. The files that are loaded are based off the
`system-name` nad `user-login-name`. Look at the function
`load-system-specific-configs` in the `init.el` for details

A function `install-package` is made available early while loading
`init.el`. If you wanted to install the package `align-cljlet` then in
one of the user override files you would specify `(install-package 'algin-cljlet)`.

Has some additional functionality added for working in Clojure. Some
of them include improving paredit usage in the repl, adding
[clj-refactor](https://github.com/magnars/clj-refactor.el), using
`company` for auto-completion, and some other smaller tweaks.

It also will load user/system specific configuration files if found.
This allows you to add additional functionality depending on what
machine you are working on.

Defaults to using
[Inconsolata](http://levien.com/type/myfonts/inconsolata.html) as the
font. If you don't have this installed you'll probably see whatever
terrible default font is used.

Useful re-mappings to know about:
- `C-w` remapped to `backward-kill-word`
- `C-x C-k` and `C-c C-k` remapped to `kill-region`
- `C-x C-m` and `C-c C-m` remapped to `smex` (same as `M-x` in this setup)

Useful added functions:
- `scratch-buffer` - Opens up temporary buffer
- `revert-all-buffers` - Refreshes all open buffers
- `rename-file-and-buffer` - Renames current buffer and file

## Color Theme

The default color theme is **zenburn**. If you want to use something
else then the recommended way of doing so is to `(setq
user-specific-color-theme 'sanityinc-tomorrow-eighties)`
`'sanity-inc-tomorrow-eighties` is whatever color theme you want. This
should be done in your `user/username.el` file.
