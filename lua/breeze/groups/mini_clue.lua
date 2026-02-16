local M = {}

M.url = "https://github.com/echasnovski/mini.clue"

---@type breeze.HighlightsFn
function M.get(c)
  -- stylua: ignore
  return {
    MiniClueBorder              = "FloatBorder",
    MiniClueDescGroup           = "DiagnosticFloatingWarn",
    MiniClueDescSingle          = "NormalFloat",
    MiniClueNextKey             = "DiagnosticFloatingHint",
    MiniClueNextKeyWithPostkeys = "DiagnosticFloatingError",
    MiniClueSeparator           = "DiagnosticFloatingInfo",
    MiniClueTitle               = "FloatTitle",
  }
end

return M
