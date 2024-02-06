require("dwclake")

vim.cmd(":set nofoldenable")	

vim.filetype.add {
    extension = {
        onyx = "onyx",
    },
    pattern = {
        [".*onyx$"] = "onyx",
    },
}
