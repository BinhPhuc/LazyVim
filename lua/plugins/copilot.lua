return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true, -- Tự động gợi ý khi gõ
        keymap = {
          accept = "<M-l>", -- Nhấn Alt + L để nhận gợi ý
        },
      },
      panel = { enabled = true },
    })
  end,
}
