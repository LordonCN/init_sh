# coc-bookmark

Bookmark manager extension for [coc.nvim](https://github.com/neoclide/coc.nvim)

Features as [vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks)

![](https://user-images.githubusercontent.com/20282795/67162033-f0aaa200-f392-11e9-9421-edff0893fe60.png)

## Install

```
:CocInstall coc-bookmark
```

## Features

- Add/Delete a bookmark
- Add annotation to a bookmark
- Navigate bookmarks with CocList
- Bookmark will be deleted if the line was changed

## Configuration

```jsonc
"bookmark.enable": {
    "type": "boolean",
    "default": true,
    "description": "Whether to enable this extension"
},
"bookmark.maxsize": {
    "type": "number",
    "default": 5000,
    "description": "Maxsize of bookmark"
},
"bookmark.sign": {
    "type": "string",
    "default": "⚑",
    "description": "Bookmark icon for sign column"
},
"bookmark.signHi": {
  "type": "string",
  "default": "Identifier",
  "description": "Highlight group for sign"
}
```

## Commands

- `:CocCommand bookmark.toggle`: create/delete a bookmark
- `:CocCommand bookmark.annotate`: create a bookmark with annotation
- `:CocCommand bookmark.prev`: jump to the prev bookmark
- `:CocCommand bookmark.next`: jump to the next bookmark

## Keymaps

- Normal mode: `<Plug>(coc-bookmark-next)`
- Normal mode: `<Plug>(coc-bookmark-prev)`
- Normal mode: `<Plug>(coc-bookmark-toggle)`
- Normal mode: `<Plug>(coc-bookmark-annotate)`

```vim
" Example configuration
nmap <Leader>bj <Plug>(coc-bookmark-next)
nmap <Leader>bk <Plug>(coc-bookmark-prev)
```

## CocList

run `:CocList bookmark` to open the bookmark

- Filter your bookmarks and perform operations via `<Tab>`
- Use `preview` to preview the line you have marked
- Use `delete` to delete a bookmark
- Use `o` to jump to the marked line in the file

## F.A.Q

Q: Where is the bookmark data stored?

A: Normally the data is saved in `~/.config/coc/extensions/coc-bookmark-data`, but if you set `g:coc_extension_root` to another location, it will change as well

## License

MIT
