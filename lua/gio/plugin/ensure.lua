local pack_path = vim.fn.stdpath("data") .. "/site/pack"

local function ensure(repository)
    local name = vim.split(repository, "/")[2]
    local destination = string.format("%s/packer/start/%s", pack_path, name)

    if vim.fn.empty(vim.fn.glob(destination)) > 0 then
        vim.notify("GIO: auto-installing " .. repository .. "...")
        vim.fn.system({
            "git", "clone", "--depth", "1",
            "https://github.com/" .. repository, destination,
        })

        if vim.v.shell_error ~= 0 then
            vim.notify(
                "GIO: failed to auto-install " .. repository .. "...",
                vim.log.levels.ERROR
            )
        else
            vim.notify("GIO: auto-installed " .. repository .. "...")
        end
    end
end

ensure("wbthomason/packer.nvim")
