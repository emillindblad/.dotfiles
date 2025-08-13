return {
  'catgoose/nvim-colorizer.lua',
  event = 'VeryLazy',
  opts = {
    -- lazy_load = true,
    filetypes = {
      '*',
      'css',
      cmp_docs = { always_update = true },
      cmp_menu = { always_update = true },
    },
    user_default_options = {
      names = false,
      tailwind = 'both',
      tailwind_opts = {
        update_names = true,
      },
    },
  },
}
