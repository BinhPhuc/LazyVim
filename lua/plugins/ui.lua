return {
  -- Tự động đóng thẻ HTML trong React
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  -- Cấu hình thêm cho Tailwind (Hiển thị màu sắc và sắp xếp class)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          filetypes_exclude = { "markdown" },
          settings = {
            tailwindCSS = {
              includeLanguages = {
                typescriptreact = "typescriptreact",
              },
            },
          },
        },
      },
    },
  },

  -- Thêm icon màu sắc cho các class Tailwind trong menu gợi ý (cmp)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- Formatter này sẽ giúp hiển thị icon màu nhỏ cạnh class Tailwind
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
