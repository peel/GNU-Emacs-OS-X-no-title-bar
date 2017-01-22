A (barely) modified version of [a patch by Jay McCarthy](https://lists.gnu.org/archive/html/bug-gnu-emacs/2016-10/msg00003.html) to provide a variable--`ns-use-title-bar`--allowing [GNU Emacs (when running on OS X)](https://github.com/braham-snyder/homebrew-emacs-plus) to elide the OS X title bar of its frames. This is also known as a "borderless" window:

```
Non-nil means to include the title bar on frames.  Nil means to
omit the title bar on OSX >= 10.7.  This variable is ignored on OSX <
10.7. Note that the first frame per emacs session (unless it is an
emacsclient) will use the default value of this variable (nil--do not
include a title bar), ignoring (!) the user-set value of this
variable. This is almost certainly due to a bug in the patch adding
this variable. Default is nil.
```

![screen shot](https://i.imgur.com/cR57gkl.png)