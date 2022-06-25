local pack_path = vim.fn.stdpath("data") .. "/site/pack"

local function ensure(repository)
    local name = vim.split(repository, "/")[2]
    local destination = string.format("%s/paqs/opt/%s", pack_path, name)

    if vim.fn.empty(vim.fn.glob(destination)) > 0 then
        vim.notify("GOI: auto-installing " .. repository .. "...")
        vim.fn.system({
            "git", "clone", "--depth", "1",
            "https://github.com/" .. repository, destination,
        })

        if vim.v.shell_error ~= 0 then
            vim.notify(
                "GOI: failed to auto-install " .. repository .. "...",
                vim.log.levels.ERROR
            )
        else
            vim.notify("GOI: auto-installed " .. repository .. "...")
        end
    end
end

ensure("savq/paq-nvim")          -- Default plugin manager
ensure("Chromosore/lazily-nvim") -- Lazy-loader

vim.cmd "packadd paq-nvim"
vim.cmd "packadd lazily-nvim"
