-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/krashmello/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/krashmello/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/krashmello/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/krashmello/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/krashmello/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["coc-eslint"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/coc-eslint",
    url = "https://github.com/neoclide/coc-eslint"
  },
  ["coc-vetur"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/coc-vetur",
    url = "https://github.com/neoclide/coc-vetur"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["deoplete.nvim"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/deoplete.nvim",
    url = "https://github.com/shougo/deoplete.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  indentline = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/indentline",
    url = "https://github.com/yggdroot/indentline"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-autoformat"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/vim-autoformat",
    url = "https://github.com/chiel92/vim-autoformat"
  },
  ["vim-autotag"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/vim-autotag",
    url = "https://github.com/craigemery/vim-autotag"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/vim-closetag",
    url = "https://github.com/alvan/vim-closetag"
  },
  ["vim-cyberpunk"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/vim-cyberpunk",
    url = "https://github.com/thedenisnikulin/vim-cyberpunk"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-vue-plugin"] = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/vim-vue-plugin",
    url = "https://github.com/leafoftree/vim-vue-plugin"
  },
  youcompleteme = {
    loaded = true,
    path = "/home/krashmello/.local/share/nvim/site/pack/packer/start/youcompleteme",
    url = "https://github.com/valloric/youcompleteme"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
