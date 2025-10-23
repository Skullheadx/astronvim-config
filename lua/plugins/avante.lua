-- Avante.nvim configuration with error handling
return {
  "yetone/avante.nvim",
  opts = function(_, opts)
    -- Add error handling for sidebar rendering issues
    -- This helps prevent crashes from extmark out of range errors
    if not opts.behaviour then opts.behaviour = {} end

    -- Disable problematic features that can cause extmark errors
    opts.behaviour.auto_suggestions = false
    opts.behaviour.auto_set_highlight_group = true

    -- Add safer rendering options
    if not opts.windows then opts.windows = {} end
    opts.windows.wrap = true

    return opts
  end,
}
