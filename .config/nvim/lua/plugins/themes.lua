local ayu = {
    "shatur/neovim-ayu",
    config = function()
        require('ayu').setup({
            overrides = {
                Normal = { bg = "None" },
                NormalFloat = { bg = "none" },
                ColorColumn = { bg = "None" },
                SignColumn = { bg = "None" },
                Folded = { bg = "None" },
                FoldColumn = { bg = "None" },
                CursorLine = { bg = "None" },
                CursorColumn = { bg = "None" },
                VertSplit = { bg = "None" },
                LineNr = { fg = "#b5b3ad", bg = "None" }
            },
        })
    end
}

local luna = {
  "wtfox/luna.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}

local rosepine = {
    "rose-pine/neovim",
    name = "rose-pine",
}

return { ayu, luna, rosepine }
