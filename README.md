f2j-mode
========

Emacs major mode for editing f2j source code

## Dependencies

* [quickrun](https://github.com/syohex/emacs-quickrun)

## Installation

First you need to install `quickrun.el` from [MELPA](http://melpa.org/) with
package.el.

Then Clone the project:

    $ git clone https://github.com/zhiyuanshi/f2j-mode.git

Add the directory to your `load-path` and require the library.

    (add-to-list 'load-path "#{Path to your just-cloned directory}")
    (require 'f2j-mode)
    (require 'quickrun)

And you're good to go! F2J mode will be automatically turned on for `.sf` files.

## Interactive Commands

`C-c C-r` will invoke `f2j` command and compile the source file. You
can also `M-x quickrun` to compile and run the source file.

## TODO

1. Add indentation feature
