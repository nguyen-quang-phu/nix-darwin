return {
  "nvzone/volt",
  {
    "nvzone/timerly",
    cmd = "TimerlyToggle",
    opts = {
      on_finish = function()
        vim.notify("Timerly: time's up!")
      end,
    },
  },
}
