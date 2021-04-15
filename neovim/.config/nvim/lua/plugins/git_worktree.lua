local Worktree = require("git-worktree")

Worktree.setup({update_on_change = false})

Worktree.on_tree_change(function(_, path)
    Worktree.update_current_buffer()
    require('nvim-tree.lib').change_dir(Worktree.get_worktree_path(path))
end)
