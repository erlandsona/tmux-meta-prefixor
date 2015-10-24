# meta_prefixor
Reset all your TMUX default bindings with the -n flag and use caps lock or option (eg: the meta key or esc+ in iTerm2) instead of a prefix!

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'erlandsona/meta_prefixor'

Hit `prefix + I` to fetch the plugin and source it. You should now be able to
use the plugin.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/erlandsona/meta_prefixor ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/meta_prefixor.tmux

Reload TMUX environment with: `$ tmux source-file ~/.tmux.conf`. You should now
be able to use the plugin.

### License

[MIT](LICENSE)
