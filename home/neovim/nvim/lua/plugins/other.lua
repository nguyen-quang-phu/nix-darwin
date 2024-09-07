return {
  {
    "rgroli/other.nvim",
    lazy = false,
    config = function()
      local rails_alternative_targets = {
        { context = "model", target = "/app/models/%1.rb", transformer = "singularize" },
        { context = "controller", target = "/app/controllers/**/%1_controller.rb" },
        { context = "view", target = "/app/views/%1/*.html*" },
        { context = "view", target = "/app/views/%1/*.html*", transformer = "singularize" },
        { context = "channel", target = "/app/channels/**/%1_channel.rb" },
        { context = "mailer", target = "/app/mailers/%1_mailer.rb" },
        { context = "serializer", target = "/app/serializers/%1_serializer.rb" },
        { context = "mailer", target = "/app/mailers/%1_mailer.rb" },
        { context = "service", target = "/app/services/%1_service.rb" },
        { context = "worker", target = "/app/workers/**/%1_worker.rb" },
        { context = "factories", target = "/spec/factories/%1.rb", transformer = "singularize" },
      }
      require("other-nvim").setup {
        mappings = {
          -- builtin mappings
          "livewire",
          "angular",
          "laravel",
          "rails",
          "golang",
          -- custom mapping
          {
            pattern = "(.+)/spec/(.*)/(.*)/(.*)_spec.rb",
            target = {
              { target = "%1/db/%3/%4.rb" },
              { target = "%1/app/%3/%4.rb" },
              { target = "%1/%3/%4.rb" },
            },
          },
          {
            pattern = "(.+)/spec/(.*)/(.*)_spec.rb",
            target = {
              { target = "%1/db/%2/%3.rb" },
              { target = "%1/app/%2/%3.rb" },
              { target = "%1/lib/%2/%3.rb" },
            },
          },
        },
        transformers = {
          -- defining a custom transformer
          lowercase = function(inputString) return inputString:lower() end,
        },
        style = {
          -- How the plugin paints its window borders
          -- Allowed values are none, single, double, rounded, solid and shadow
          border = "solid",

          -- Column seperator for the window
          seperator = "|",

          -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
          width = 0.7,

          -- min height in rows.
          -- when more columns are needed this value is extended automatically
          minHeight = 2,
        },
      }
    end,
  },
}
