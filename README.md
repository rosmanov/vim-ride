# About

Syntax highlighting for the [RIDE](https://docs.wavesplatform.com/en/ride/about-ride.html) language.

## Code Completion and Linting

Code completion and linting can be configured as follows:

1. Install [coc](https://github.com/neoclide/coc.nvim).
2. Install [VS Code extension](https://github.com/wavesplatform/ride-vscode):
```
:CocInstall https://github.com/wavesplatform/ride-vscode
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
            "module": "/usr/lib/node_modules/@waves/ride-language-server/main.js",
            "settings": { "validate": true },
            "trace.server": "verbose"
        }
    }
}
```
4. Restart (Neo)Vim or run `:CocRestart`.

**Screencast**
[![asciicast](https://asciinema.org/a/zpSb8Sc6mRaVqZ618NlRnc2KY.svg)](https://asciinema.org/a/zpSb8Sc6mRaVqZ618NlRnc2KY)

# Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):
```
Plug 'rosmanov/vim-ride'
```

Alternatively, copy the following directories to the vim configuration directory (usually `~/.vim/`):

- ftdetect/
- ftplugin/
- indent/
- syntax/
