-- Override highlight groups to keep visibility with transparent background
local bg1 = "#1b1b1b"
local bg2 = "#212122"
local bg3 = "#292b2b"
local fg1 = "#ffffff"
local fg2 = "#969896"
local accent = "#FD8F3F"
local accent2 = "#D0BF68"
local accent3 = "#5DD8FF"
local accent4 = "#FC6A5D"

-- Core UI
vim.api.nvim_set_hl(0, "CursorLine", { bg = bg2 })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = bg2 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = accent, bold = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#5c5e5e" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = bg1 })
vim.api.nvim_set_hl(0, "Visual", { bg = "#3a3b41" })
vim.api.nvim_set_hl(0, "VisualNOS", { bg = "#3a3b41" })
vim.api.nvim_set_hl(0, "Search", { fg = "#292A30", bg = accent2 })
vim.api.nvim_set_hl(0, "IncSearch", { fg = "#292A30", bg = accent })
vim.api.nvim_set_hl(0, "CurSearch", { fg = "#292A30", bg = accent })
vim.api.nvim_set_hl(0, "MatchParen", { fg = fg1, bg = bg3, bold = true })
vim.api.nvim_set_hl(0, "YankHighlight", { bg = bg3 })

-- Menus and floating
vim.api.nvim_set_hl(0, "Pmenu", { fg = fg2, bg = bg1 })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = fg1, bg = "#34353b", bold = true })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = bg2 })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#5c5e5e" })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg1, bg = bg1 })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#3f4040", bg = bg1 })

-- LSP / diagnostics focus
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = bg3 })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = bg3 })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = bg3 })
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = accent4 })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = accent2 })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = accent3 })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#59B0CF" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = accent4 })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = accent2 })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = accent3 })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#59B0CF" })

-- Plugin-specific highlight helpers
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = bg3 })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = bg3 })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = bg3 })
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#5c5e5e" })
vim.api.nvim_set_hl(0, "MiniJump", { fg = fg1, bg = accent })
vim.api.nvim_set_hl(0, "MiniJump2dSpot", { fg = fg1, bg = accent })
vim.api.nvim_set_hl(0, "MiniJump2dSpotUnique", { fg = fg1, bg = accent4 })
vim.api.nvim_set_hl(0, "MiniTrailspace", { bg = accent4 })
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = bg1 })
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = fg2, bg = bg1 })
