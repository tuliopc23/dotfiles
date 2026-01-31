local M = {}

local colors = {
  bg = "#292A30",
  bg_alt = "#252629",
  base0 = "#0d0d0d",
  base1 = "#1b1b1b",
  base2 = "#212122",
  base3 = "#292b2b",
  base4 = "#3f4040",
  base5 = "#5c5e5e",
  base6 = "#757878",
  base7 = "#969896",
  base8 = "#ffffff",
  fg = "#ffffff",
  fg_alt = "#969896",
  fg_dark = "#6c7986",

  red = "#FC6A5D",
  orange = "#FD8F3F",
  yellow = "#D0BF68",
  green = "#67B7A4",
  blue = "#5DD8FF",
  teal = "#59B0CF",
  magenta = "#D0A8FF",
  cyan = "#8abeb7",
  grey = "#6C7986",
  light_green = "#9EF1DD",
  violet = "#A167E6",
  dark_blue = "#41A1C0",
  pink = "#FC5FA3",
}

colors.selection = "#32333a"
colors.visual = "#3a3b41"
colors.bg_highlight = "#34353b"
colors.border = colors.base4
colors.scrollbar_thumb = colors.base5
colors.cursor = colors.blue
colors.line_number = colors.base5

colors.comment = colors.grey
colors.constant = colors.violet
colors.function_name = colors.magenta
colors.keyword = colors.pink
colors.operator = colors.orange
colors.type = colors.blue
colors.string = colors.red
colors.number = colors.yellow
colors.variable = colors.dark_blue
colors.property = colors.dark_blue
colors.parameter = colors.teal
colors.boolean = colors.violet
colors.attribute = colors.orange

colors.error = colors.red
colors.warning = colors.yellow
colors.info = colors.blue
colors.hint = colors.teal
colors.todo = colors.orange

colors.diff_add = colors.green
colors.diff_change = colors.yellow
colors.diff_delete = colors.red

colors.git_add = colors.green
colors.git_change = colors.yellow
colors.git_delete = colors.red
colors.git_ignored = colors.base6

colors.purple = colors.magenta

function M.get_colors()
  return colors
end

return M
