return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
		mapping = cmp.mapping.preset.insert({
			      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
			      ['<C-f>'] = cmp.mapping.scroll_docs(4),
			      ['<C-Space>'] = cmp.mapping.complete(),
			      ['<C-e>'] = cmp.mapping.abort(),
			      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    		}),
   		sources = cmp.config.sources({
       		 { name = 'luasnip' }, 
           { name = "nvim_lsp"},
		       { name = "buffer" },
		       { name = "path" },
    		})
      }) 
	end
}
