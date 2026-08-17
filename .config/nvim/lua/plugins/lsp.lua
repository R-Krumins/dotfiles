-- configurations for language servers
local lsp_config = {
    "neovim/nvim-lspconfig"
}

-- language server package mangaer
local mason = {
    "mason-org/mason.nvim",
    config = function()
        require("mason").setup()
    end
}

-- completion ui
local blink_cmp = {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    keymap = { preset = 'super-tab' },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = { documentation = { auto_show = true } },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}

return {lsp_config, mason, blink_cmp}
