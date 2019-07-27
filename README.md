# About

Syntax highlighting and indentation for the [RIDE](https://docs.wavesplatform.com/en/ride/about-ride.html) language.

# Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):
```
:Plug 'rosmanov/vim-ride'
:PlugInstall
```

Alternatively, copy the following directories to the vim configuration directory (usually `~/.vim/`):

- ftdetect/
- ftplugin/
- indent/
- syntax/

## Code Completion and Linting

The plugin itself doesn't support code completion and linting, but these can be configured as follows:

1. Install [Coc](https://github.com/neoclide/coc.nvim) plugin.
2. Install [VS Code extension](https://github.com/wavesplatform/ride-vscode), e.g.:
```
# npm install -g '@waves/ride-language-server'
```
3. Open CoC configuration: `:CocConfig` and put a path to the language server launcher (`node_modules/@waves/ride-language-server/main.js`) as follows:
```
{
    "languageserver": {
        "ride": {
            "args": [ "--node-ipc" ],
            "execArgv": [ "--nolazy" ],
            "filetypes": [ "ride" ],
            "initializationOptions": {},
            "module": "/usr/lib64/node_modules/@waves/ride-language-server/main.js",
            "settings": { "validate": true },
            "trace.server": "verbose"
        }
    }
}
```
4. Restart (Neo)Vim or run `:CocRestart`.

**Notes**

- The `npm install -g` command requires superuser permissions. You may want to run it via `sudo`.
- **Coc** plugin uses different locations for Vim/gVim and NeoVim configuration (see the [documentation](https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file#configuration-file-resolve)). You may want to make a symbolic link as follows:
```
mkdir -p $HOME/.vim/
ln -s $HOME/.config/nvim/coc-settings.json $HOME/.vim/
```

**Screencast**

[![asciicast](https://asciinema.org/a/dPviBAHLmQzueHIs7D4ymJ9Y8.svg)](https://asciinema.org/a/dPviBAHLmQzueHIs7D4ymJ9Y8)
