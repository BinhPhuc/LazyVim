return {
  "stevearc/conform.nvim",
  opts = {
    -- Cấu hình chi tiết cho từng formatter
    formatters = {
      -- Cho C++, Java, C# (Sử dụng clang-format)
      clang_format = {
        prepend_args = { "--style={SpacesInAngles: false, Standard: Cpp11}" },
      },
      -- Cho TypeScript, JavaScript, JSON, v.v. (Sử dụng prettier)
      prettier = {
        -- Prettier mặc định không thêm space vào <T>,
        -- nhưng nếu có plugin lạ can thiệp, ta ép bracketSpacing về false
        prepend_args = { "--no-bracket-spacing" },
      },
    },
    -- Đảm bảo các ngôn ngữ này được gán đúng formatter
    formatters_by_ft = {
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      cpp = { "clang-format" },
      java = { "clang-format" }, -- Ép Java dùng clang-format để dễ tùy chỉnh
    },
  },
}
