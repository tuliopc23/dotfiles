local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- SwiftUI View
  s("view", fmt([[
import SwiftUI

struct {}: View {{
    var body: some View {{
        {}
    }}
}}

#Preview {{
    {}()
}}
]], {
    i(1, "MyView"),
    i(2, 'Text("Hello, World!")'),
    i(3, "MyView"), -- Matches the struct name
  }, { repeat_duplicates = true })),

  -- State Property
  s("state", fmt([[
@State private var {}: {} = {}
]], {
    i(1, "name"),
    i(2, "Bool"),
    i(3, "false"),
  })),

  -- Binding Property
  s("bind", fmt([[
@Binding var {}: {}
]], {
    i(1, "name"),
    i(2, "Type"),
  })),

  -- Environment Property
  s("env", fmt([[
@Environment(\.{}) var {}
]], {
    i(1, "colorScheme"),
    i(2, "colorScheme"),
  })),

  -- Task
  s("task", fmt([[
.task {{
    {}
}}
]], {
    i(1, "// perform async work"),
  })),
  
  -- Main Actor function
  s("main", fmt([[
@MainActor
func {}() async {{
    {}
}}
]], {
    i(1, "performAction"),
    i(2),
  })),
}
