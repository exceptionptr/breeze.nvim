---@class breeze.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias breeze.Highlights table<string,breeze.Highlight|string>

---@alias breeze.HighlightsFn fun(colors: ColorScheme, opts:breeze.Config):breeze.Highlights

---@class breeze.Cache
---@field groups breeze.Highlights
---@field inputs table
