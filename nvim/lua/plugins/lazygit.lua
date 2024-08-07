return {
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            'nvim-telescope/telescope.nvim',
        },
        keys = {
            { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    }
}
