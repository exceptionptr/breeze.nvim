# Contributing to Breeze

Thank you for your interest in contributing to Breeze! Pull requests are welcome.

## Adding Plugin Support

The most common contribution is adding highlight groups for a new Neovim plugin. Here's how to do it:

### Plugin Module Structure

Each plugin has its own file in `lua/breeze/groups/` that defines the highlight groups for that plugin. A typical plugin module looks like this:

```lua
local M = {}

M.url = "https://github.com/author/plugin-name"

---@type breeze.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    HighlightGroup1 = { fg = c.blue, bg = c.bg },
    HighlightGroup2 = { fg = c.red, bold = true },
    HighlightGroup3 = { link = "Normal" },
  }
end

return M
```

### Available Colors

The `c` parameter contains all theme colors. Common colors include:

**Foreground/Background:**
- `c.fg`, `c.bg` - main foreground/background
- `c.fg_dark`, `c.bg_dark` - darker variants
- `c.fg_gutter`, `c.bg_highlight` - gutter and highlight backgrounds
- `c.bg_float` - floating window background
- `c.border_highlight` - border color

**Basic Colors:**
- `c.blue`, `c.cyan`, `c.green`, `c.magenta`, `c.orange`, `c.purple`, `c.red`, `c.teal`, `c.yellow`
- `c.blue0` through `c.blue7` (and similar for other colors) - color variations

**Semantic Colors:**
- `c.error`, `c.warning`, `c.info`, `c.hint` - diagnostic colors
- `c.comment` - comment color
- `c.none` - transparent/no color

**Terminal Colors:**
- `c.terminal_black`, `c.terminal.black_bright`, etc.

For the complete list of available colors, see [colors.lua](lua/breeze/colors.lua).

### Highlight Attributes

Each highlight group can have these attributes:

- `fg` - foreground color
- `bg` - background color
- `sp` - special color (for underlines, etc.)
- `bold` - boolean
- `italic` - boolean
- `underline` - boolean
- `undercurl` - boolean
- `strikethrough` - boolean
- `link` - link to another highlight group (e.g., `link = "Normal"`)

### How to Add Plugin Support

1. **Find the highlight groups**: Check the plugin's documentation or source code to find the highlight group names it uses. You can also use `:Telescope highlights` or `:so $VIMRUNTIME/syntax/hitest.vim` to see active highlight groups.

2. **Create the plugin file**: Create a new file `lua/breeze/groups/plugin-name.lua`:

   ```lua
   local M = {}

   M.url = "https://github.com/author/plugin-name"

   ---@type breeze.HighlightsFn
   function M.get(c, opts)
     -- stylua: ignore
     return {
       PluginHighlight1 = { fg = c.blue },
       PluginHighlight2 = { fg = c.green, bg = c.bg_dark },
       -- ... more highlight groups
     }
   end

   return M
   ```

3. **Register the plugin**: Add an entry to the `M.plugins` table in `lua/breeze/groups/init.lua`:

   ```lua
   M.plugins = {
     -- ... existing plugins ...
     ["plugin-name"]     = "plugin-name",  -- key is the plugin repo name, value is the group file name
   }
   ```

   The key should match the plugin's repository name (what you see in lazy.nvim or other plugin managers). The value is the filename (without `.lua`) you created in step 2.

4. **Test your changes**:
   - Run the test suite: `./scripts/test`
   - Install the plugin in your Neovim config
   - Load the breeze theme
   - Verify the highlights look good in both styles (dark, light)
   - Test with both light and dark backgrounds

5. **Follow the style guide**:
   - Use `-- stylua: ignore` before the return table to prevent formatting
   - Align highlight group names for readability (as shown in examples)
   - Group related highlights together
   - Add comments if the purpose of a highlight isn't obvious

### Tips for Choosing Colors

- Look at similar highlight groups in [base.lua](lua/breeze/groups/base.lua) for consistency
- Use semantic colors (`c.error`, `c.warning`, etc.) for diagnostic-related highlights
- Use `c.comment` for subtle/muted text
- Use `c.fg_dark` for less important text
- For UI elements, prefer `c.bg_float` over `c.bg` for floating windows
- When in doubt, link to an existing group: `{ link = "Normal" }`

### Testing Different Styles

Make sure to test your highlights with all theme styles:

```lua
-- In your Neovim config
vim.cmd("colorscheme breeze-dark")
vim.cmd("colorscheme breeze-light")
```

### Example: Adding a Simple Plugin

Here's a complete example for a fictional plugin called "cool-finder.nvim":

1. Create `lua/breeze/groups/cool-finder.lua`:

```lua
local M = {}

M.url = "https://github.com/author/cool-finder.nvim"

---@type breeze.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    CoolFinderNormal   = { fg = c.fg, bg = c.bg_float },
    CoolFinderBorder   = { fg = c.border_highlight, bg = c.bg_float },
    CoolFinderTitle    = { fg = c.blue, bold = true },
    CoolFinderMatch    = { fg = c.magenta, bold = true },
    CoolFinderSelected = { fg = c.fg, bg = c.bg_highlight },
  }
end

return M
```

2. Add to `lua/breeze/groups/init.lua`:

```lua
M.plugins = {
  -- ... existing entries ...
  ["cool-finder.nvim"] = "cool-finder",
}
```

That's it! The plugin will now automatically be themed when loaded.

## Testing

Before submitting any PR, always run the test suite to ensure your changes don't break existing functionality:

```sh
./scripts/test
```

This will run all tests including:
- Colorscheme loading tests
- Highlight group generation tests
- Plugin integration tests

Make sure all tests pass before submitting your PR.

## General Contribution Guidelines

- Follow the existing code style
- Test your changes thoroughly (run `./scripts/test`)
- Keep commit messages clear and descriptive
- Update documentation if needed

Thank you for contributing!
