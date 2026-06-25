local M = {}
local cached_lspconfig_to_package = nil

---Builds a map from lspconfig server id to Mason package name.
---@param registry table mason-registry module
---@return table<string, string>
function M.get_lspconfig_to_package_map(registry)
  if cached_lspconfig_to_package then
    return cached_lspconfig_to_package
  end

  local lspconfig_to_package = {}

  for _, pkg_spec in ipairs(registry.get_all_package_specs()) do
    local lspconfig = vim.tbl_get(pkg_spec, "neovim", "lspconfig")
    if lspconfig then
      lspconfig_to_package[lspconfig] = pkg_spec.name
    end
  end

  cached_lspconfig_to_package = lspconfig_to_package
  return cached_lspconfig_to_package
end

function M.clear_cache()
  cached_lspconfig_to_package = nil
end

return M