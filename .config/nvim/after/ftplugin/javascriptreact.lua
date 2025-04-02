local root_files = { 'package.json', 'eslint.config.js' }
local project = require("config.mod.project_utils")
local paths_infos = project.get_project_paths()
local config_folder = project.root_config_folder(paths_infos, root_files)
project.config_root_lint(config_folder)
