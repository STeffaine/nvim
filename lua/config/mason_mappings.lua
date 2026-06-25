local M = {}

---Builds a map from lspconfig server id to Mason package name.
---@param registry table mason-registry module
---@return table<string, string>
function M.get_lspconfig_to_package_map(registry)
  local lspconfig_to_package = {}

  for _, pkg_spec in ipairs(registry.get_all_package_specs()) do
    local lspconfig = vim.tbl_get(pkg_spec, "neovim", "lspconfig")
    if lspconfig then
      lspconfig_to_package[lspconfig] = pkg_spec.name
    end
  end

  return lspconfig_to_package
end

return M