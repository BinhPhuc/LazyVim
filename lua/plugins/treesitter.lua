return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- 1. Kiểm tra nếu là Windows thì ép dùng Zig làm trình biên dịch
      -- vim.fn.has("win32") trả về 1 nếu là Windows, 0 nếu không phải
      if vim.fn.has("win32") == 1 then
        require("nvim-treesitter.install").compilers = { "zig" }
      end

      -- 2. Đảm bảo parser "diff" luôn được cài đặt
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "diff" })
      end
    end,
  },
}
