require("config.lazy")
require("config.options")
require("config.keymaps")

vim.cmd([[
function! CommentBlock(comment, intro, end, box_char, ...)
    let linewidth = &textwidth> 0? &textwidth : 80
    let linewidth = a:0 >= 1 ? a:1 : linewidth

    let comwidth = strlen(a:comment) + 2
    let boxwidth1 = (linewidth - comwidth - len(a:intro) - len(a:end)) / 2
    let boxwidth1 = boxwidth1>0 ? boxwidth1 : 0

    let boxwidth2 = (linewidth - len(a:intro) -len(a:end) - boxwidth1 - comwidth)
    return a:intro . repeat(a:box_char, boxwidth1) . ' ' . a:comment
                \ . ' ' .repeat(a:box_char, boxwidth2) . a:end
endfunction

function! Header()
    let text = input('Comment Text: ')
    execute ":call CommentBlock(text, '//', '//', '-') "
endfunction

]])

function Malick()
	vim.fn.setline(".", new_line)
	vim.fn.col(c) -- restore cursor position
end
