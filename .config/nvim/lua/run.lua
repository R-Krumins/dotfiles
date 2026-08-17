local runCommand = ""

local function setRun(cmd)
    runCommand = cmd
end

local function run()
    vim.cmd("silent! wa")

    local out = vim.fn.system(runCommand)

    vim.notify(out, nil, {
        title = "Ran: " .. runCommand,
    })
end

vim.api.nvim_create_user_command("SetRun", function(opts)
    setRun(opts.args)
end, {
    nargs = 1,
})

vim.api.nvim_create_user_command("Run", function()
    run()
end, {})

vim.keymap.set("n", "<leader>r", run, { desc = "[R]un" })


