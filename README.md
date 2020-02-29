# fzf-to-function
Blazing fast jump to function/method definition of the current file without
using language server or Ctags.

Language agnostic



Installation
------------

fzf-to-functions.vim depends on the basic Vim plugin of https://github.com/junegunn/fzf.vim, so make sure you have this instealled.


### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'AlexVKO/fzf-to-functions.vim'
```

How to
----------------
1. Setup a mapping, example:
```vim
  nnoremap <silent> <leader>m :FzfMethods <cr>
```

2. Use it 

![how to](https://github.com/AlexVKO/fzf-to-functions.vim/raw/master/doc/howto.gif)


## Supported Languages
- [x] Elixir
- [x] Ruby
- [ ] Javascript
- [ ] Erlang
- [ ] Python
- [ ] Add your language here


License
------------
MIT
