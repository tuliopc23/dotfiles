local M = {}

function M.apply()
  local ok, palette = pcall(require, "dexco.palette")
  if not ok then
    return
  end

  local teal = palette.identifier_variable or "#67b7a4"
  local aqua = palette.declaration_other or "#41a1c0"
  local blue = palette.url or "#5482ff"
  local rose = palette.keyword or "#fc5fa3"
  local coral = palette.string or "#fc6a5d"
  local sand = palette.number or "#d0bf69"
  local mint = palette.identifier_type or "#9ef1dd"
  local comment = palette.comment or "#6c7986"
  local doc = palette.comment_doc or comment
  local amber = palette.identifier_macro or "#fd8f3f"

  local groups = {
    ["@variable.parameter.builtin"] = { fg = aqua },
    ["@label"] = { fg = aqua },

    ["@property"] = { fg = teal },
    ["@property.json"] = { fg = teal },
    ["@variable.member"] = { fg = teal },

    ["@string.documentation"] = { fg = doc, italic = true },
    ["@string.regexp"] = { fg = coral },
    ["@string.special"] = { fg = teal },
    ["@string.special.symbol"] = { fg = teal },
    ["@string.special.path"] = { fg = teal },
    ["@string.special.url"] = { fg = blue },
    ["@string.escape"] = { fg = aqua },
    ["@character.special"] = { fg = sand },

    ["@type.definition"] = { fg = aqua },
    ["@attribute.builtin"] = { fg = rose },
    ["@keyword.debug"] = { fg = rose },
    ["@keyword.directive.define"] = { fg = rose },

    ["@comment.error"] = { fg = coral, bold = true },
    ["@comment.warning"] = { fg = amber, bold = true },
    ["@comment.todo"] = { fg = teal, bold = true },
    ["@comment.note"] = { fg = aqua, bold = true },

    ["@lsp.type.decorator"] = { fg = rose },
    ["@lsp.type.event"] = { fg = aqua },
    ["@lsp.type.regexp"] = { fg = aqua },
    ["@lsp.type.type"] = { fg = aqua },
    ["@lsp.type.typeParameter"] = { fg = aqua },

    ["@markup.strong"] = { fg = teal, bold = true },
    ["@markup.italic"] = { fg = teal, italic = true },
    ["@markup.strikethrough"] = { fg = teal, strikethrough = true },
    ["@markup.underline"] = { fg = teal, underline = true },
    ["@markup.heading"] = { fg = aqua, bold = true },
    ["@markup.heading.1"] = { fg = aqua, bold = true },
    ["@markup.heading.2"] = { fg = aqua, bold = true },
    ["@markup.heading.3"] = { fg = teal, bold = true },
    ["@markup.heading.4"] = { fg = teal, bold = true },
    ["@markup.heading.5"] = { fg = mint, bold = true },
    ["@markup.heading.6"] = { fg = mint, bold = true },
    ["@markup.quote"] = { fg = teal, italic = true },
    ["@markup.math"] = { fg = sand },
    ["@markup.link"] = { fg = teal },
    ["@markup.link.label"] = { fg = teal },
    ["@markup.link.url"] = { fg = blue, underline = true },
    ["@markup.raw"] = { fg = coral },
    ["@markup.raw.block"] = { fg = coral },
    ["@markup.list"] = { fg = teal },
    ["@markup.list.checked"] = { fg = teal },
    ["@markup.list.unchecked"] = { fg = teal },

    ["@tag"] = { fg = aqua },
    ["@tag.builtin"] = { fg = aqua },
    ["@tag.attribute"] = { fg = teal },
    ["@tag.delimiter"] = { fg = aqua },

    ["@diff.plus"] = { fg = teal },
    ["@diff.minus"] = { fg = coral },
    ["@diff.delta"] = { fg = sand },
  }

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return M

