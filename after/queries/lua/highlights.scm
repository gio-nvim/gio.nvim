;; Keywords
(("return"   @keyword) (#set! conceal ""))
(("function" @keyword) (#set! conceal "ﬦ"))

;; Function names
((function_call name: (identifier) @function (#eq? @function "require")) (#set! conceal ":"))

;; vim.*
(((dot_index_expression) @field (#eq? @field "vim.cmd"     )) (#set! conceal ""))
(((dot_index_expression) @field (#eq? @field "vim.fn"      )) (#set! conceal "#"))
