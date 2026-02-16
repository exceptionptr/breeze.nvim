---@param opts breeze.Config
return function(opts)
  local Util = require("breeze.util")

  ---@type Palette
  local colors = vim.deepcopy(Util.mod("breeze.colors.dark"))

  ---@type Palette

  Util.invert(colors)
  colors.bg = "#eff0f1"
  colors.bg_dark = "#bdc3c7"
  colors.bg_dark1 = "#aab7b8"
  colors.bg_highlight = "#e5e8e9"
  return colors
end
