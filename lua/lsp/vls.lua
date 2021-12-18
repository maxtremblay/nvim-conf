
return function(config, attach, flags, capabilities)
  config.vls.setup {
    on_attach = attach,
    flags = flags,
    capabilities = capabilities,
    cmd = {'vls'},
    single_file_support = true,
  }
end

