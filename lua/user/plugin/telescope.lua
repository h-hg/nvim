lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, 'neoclip')
  -- any other extensions loading
end