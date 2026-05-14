# stark.nvim

A personal high-contrast Neovim colorscheme built around a true black background, readable muted greys, warm amber strings, lavender keywords, blue functions/components, and cyan types/props.

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "gstark/stark.nvim",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("stark")
  end,
}
```

## Local development

```lua
{
  dir = "/path/to/stark.nvim",
  name = "stark.nvim",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("stark")
  end,
}
```

## Palette

| Role | Hex |
| --- | --- |
| Background | `#000000` |
| Foreground | `#f2f2f2` |
| Muted | `#9aa4b5` |
| Comment | `#aab4c4` |
| String / warning / search | `#ffd580` |
| Keyword / headings | `#cba6f7` |
| Function / React component | `#89b4fa` |
| Type / React prop | `#8bd5ca` |
| Constant / number | `#fab387` |
| Error / delete | `#ff7b72` |
| Add | `#a6e3a1` |

## Notes

Includes extra Markdown Tree-sitter queries so full ATX heading lines receive heading colors, even when the heading text contains bold markup.
