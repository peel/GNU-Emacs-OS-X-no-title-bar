Available as an installation flag for the homebrew formula [emacs-plus](https://github.com/d12frosted/homebrew-emacs-plus):
```
brew install emacs-plus --with-no-title-bars
```

A (barely) modified version of [a patch by Jay McCarthy](https://lists.gnu.org/archive/html/bug-gnu-emacs/2016-10/msg00003.html) to provide a variable -- `ns-use-title-bar` -- allowing [GNU Emacs (when running on OS X)](https://github.com/braham-snyder/homebrew-emacs-plus) to elide the OS-level title bar atop its frames. This is also known as a "borderless" window:


```
Non-nil to include the title bar on frames.
Nil to omit the title bar on OSX >= 10.7. This variable is
ignored on OSX < 10.7. Note that the first frame per
session (unless that frame is an emacsclient) will ignore (!) the
user-set value of this variable, and instead use the default
value of this variable (nil--do not include a title bar). This is
almost certainly due to a bug in the patch adding this variable.
Default is nil.
```

![screen shot](https://i.imgur.com/cR57gkl.png)

# Troubleshooting

I know very little about the code this patch changes -- I merely had to relocate some moved and slightly modified lines in order to get the prior patch linked above to apply successfully to the updated Emacs source. Accordingly, the best troubleshooting advice I can offer is quite basic:

* this patch could be out of date:
  * as of May 2016, I generally plan to continue updating this patch for new Emacs versions (`release` branch, not `HEAD` nor `devel`), but I offer no guarantees regarding the pace of such patches -- if you believe the patch is out-of-date, I'd appreciate your raising issue on this repo
* if using `emacs-plus` through homebrew:
  * perhaps checking the output of `brew doctor` first is best
  * if that doesn't help, some permutation of the following might do the trick (I'm sure not all of these commands are needed, but to my knowledge they're all relatively innocuous):
    * `brew prune`
    * `brew cleanup`
    * `brew uninstall emacs-plus` (I've heard but not tested that `brew reinstall <formula>` can silently cache flags)
    * `brew install emacs-plus --with-no-title-bars [<any other flags>]`
* if not using homebrew:
  * perhaps try roughly equivalent steps (to the prenominate `brew` commands) -- e.g., just downloading a fresh GNU Emacs copy, ensuring you're attempting to patch the correct copy of Emacs, ensuring you're opening the correct copy of Emacs, etc.
* else:
  * I'd appreciate it if you submit an issue for this repo (including, e.g., the output of attempting to apply the patch) -- it's very likely I won't be able to resolve it, but someone else may
