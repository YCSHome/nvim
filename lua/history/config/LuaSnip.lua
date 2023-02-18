return {
  opt = true,
  	-- follow latest release.
	tag = "v<CurrentMajor>.*",
	-- install jsregexp (optional!:).
	run = "make install_jsregexp",
  config = function()
    local ls = require "luasnip"
    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local events = require "luasnip.util.events"
    local ai = require "luasnip.nodes.absolute_indexer"
    local extras = require "luasnip.extras"
    local fmt = extras.fmt
    local m = extras.m
    local l = extras.l
    local postfix = require "luasnip.extras.postfix".postfix

    ls.add_snippets("all", {
      s("ternary", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
      })
    })

    ls.add_snippets("cpp", {
      s("for", {
        t("try "), i(1), t(" try "), i(1)
      }),
    })
  end
}
