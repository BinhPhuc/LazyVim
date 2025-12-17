return {
  {
    "Pocco81/auto-save.nvim",
    opts = {
      enabled = true, -- Bật plugin khi khởi động
      execution_message = {
        enabled = false, -- Tắt thông báo "AutoSave: saved" ở góc màn hình để đỡ vướng mắt
      },
      trigger_events = { "InsertLeave", "TextChanged" }, -- Lưu khi bạn thoát Insert Mode hoặc khi text thay đổi
      -- Điều kiện để lưu: Không lưu nếu file đang trống hoặc thuộc một số loại file đặc biệt
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
          return true -- Cho phép lưu
        end
        return false -- Không lưu
      end,
      write_all_buffers = false, -- Chỉ lưu file hiện tại bạn đang gõ
      debounce_delay = 135, -- Đợi 135ms sau khi dừng gõ mới lưu (tránh lưu quá dồn dập)
    },
  },
}
