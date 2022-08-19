local comment = load_plugin('Comment')

comment.setup {
    pre_hook = function (ctx)
        local utils = load_plugin('Comment.utils')

        local location = nil
        if ctx.ctype == utils.ctype.block then
            location = load_plugin('ts_context_commentstring.utils').get_cursor_location()
        elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
            location = load_plugin('ts_context_commentstring.utils').get_visual_start_location()
        end

        return load_plugin('ts_context_commentstring.internal').calculate_commentstring {
            key = ctx.ctype == utils.ctype.line and '__default' or '__multiline',
            location = location,
        }
    end
}
