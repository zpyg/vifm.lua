# Vifm.lua

A part of [fm-nvim](https://github.com/is0n/fm-nvim).

## Installation

- [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {'zpyg/vifm.lua'}
```

## Configuration

```lua
require("fm-nvim").setup({
    -- (Vim) Command used to open files
    edit_cmd = "edit",

    -- See `Q&A` for more info
    on_close = {},
    on_open = {},

    -- UI Options
    ui = {
        -- Default UI (can be "split" or "float")
        default = "float",

        float = {
            -- Floating window border (see ':h nvim_open_win')
            border = "none",

            -- Highlight group for floating window/border (see ':h winhl')
            float_hl = "Normal",
            border_hl = "FloatBorder",

            -- Floating Window Transparency (see ':h winblend')
            blend = 0,

            -- Num from 0 - 1 for measurements
            height = 0.8,
            width = 0.8,

            -- X and Y Axis of Window
            x = 0.5,
            y = 0.5,
        },

        split = {
            -- Direction of split
            direction = "topleft",

            -- Size of split
            size = 24,
        },
    },

    -- you can also use 'vifmrun'
    vifm_cmd = "vifm",

    -- Mappings used with the plugin
    mappings = {
        vert_split = "<C-v>",
        horz_split = "<C-h>",
        tabedit = "<C-t>",
        edit = "<C-e>",
        ESC = "<ESC>",
    },
})
```

## Usage

- open in current directory

```vim
:Vifm
```

- open in the specified directory

```vim
:Vifm <dir>
```

## Q&A

### Q: What if I want to open files in splits or tabs?

A: Use any of the default mappings (unless you've changed them)...

- `<C-h>` for horizontal split
- `<C-v>` for vertical split
- `<C-e>` for normal edit
- `<C-t>` for tabs

### Q: Can I run a function once exiting or entering the plugin?

A: Yes you can! Use the following code as a guide...

```lua
local function yourFunction()
    -- Your code goes here
end

require('fm-nvim').setup{
    -- Runs yourFunction() upon exiting the floating window (can only be a function)
    on_close = { yourFunction },

    -- Runs yourFunction() upon opening the floating window (can only be a function)
    on_open = { yourFunction }
}
```

### Q: What if I want to map `<ESC>` to close the window?

A: You can do this by mapping `<ESC>` to whatever closes your file manager (note that this may bring up other issues). This can be done with the following code...

```lua
require('fm-nvim').setup{
    mappings = {
        -- Example for Vifm
        ESC        = ":q<CR>"
    }
}
```

or you could map `<ESC>` to quit in your file manager...

### Q: Am I able to have image previews?

A: Yes and no. Assuming you are on Linux, it is possible with the help of tools like [Überzug](https://github.com/seebye/ueberzug). If you are on Mac or Windows, it is not possible.

### Q: Can I use splits instead of a floating window

A: It's possible by changing the "default" option in the "ui" table to "split"
