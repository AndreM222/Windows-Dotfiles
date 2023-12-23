local animate = require('mini.animate')
animate.setup({
    cursor = {
        -- Animate for 200 milliseconds with linear easing
        timing = animate.gen_timing.linear({ duration = 25, unit = 'total' }),

        -- Animate with shortest line for any cursor move
        path = animate.gen_path.line({
            predicate = function() return true end,
        }),
    },
    scroll = {
        enable = false,
    }

})
