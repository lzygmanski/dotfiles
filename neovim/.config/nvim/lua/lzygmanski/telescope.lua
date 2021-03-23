local M = {}

M.find_dotfiles = function()
    require('telescope.builtin').git_files({
        prompt_title = ".dotfiles",
        cwd = "~/.dotfiles"
    })
end

return M
