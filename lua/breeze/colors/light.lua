---@param opts breeze.Config
return function(opts)
  local Util = require("breeze.util")

  ---@type Palette
  local colors = {
    bg = "#eff0f1",
    bg_dark = "#bdc3c7",
    bg_dark1 = "#aab7b8",
    bg_highlight = "#e5e8e9",
    blue = "#2980b9",
    blue0 = "#3498db",
    blue1 = "#1abc9c",
    blue2 = "#16a085",
    blue5 = "#a9d6e5",
    blue6 = "#d5eff7",
    blue7 = "#5dade2",
    comment = "#7f8c8d",
    cyan = "#3498db",
    dark3 = "#95a5a6",
    dark5 = "#7f8c8d",
    fg = "#232629",
    fg_dark = "#5c6370",
    fg_gutter = "#7f8c8d",
    green = "#27ae60",
    green1 = "#2ecc71",
    green2 = "#229954",
    magenta = "#8e44ad",
    magenta2 = "#9b59b6",
    orange = "#d35400",
    purple = "#9b59b6",
    red = "#c0392b",
    red1 = "#e74c3c",
    teal = "#16a085",
    terminal_black = "#7f8c8d",
    yellow = "#f39c12",
    git = {
      add = "#27ae60",
      change = "#3498db",
      delete = "#c0392b",
    },
  }

  ---@type Palette
  return colors
end
