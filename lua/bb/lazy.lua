-- lazy.nvim-ийн байршлыг тодорхойлох
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- lazy.nvim-ийн хавтасны замыг тодорхойлох (ихэвчлэн ~/.local/share/nvim/lazy/lazy.nvim)

-- lazy.nvim хавтас байгаа эсэхийг шалгах
if not vim.loop.fs_stat(lazypath) then -- Хэрвээ lazy.nvim хавтас байхгүй бол
  vim.fn.system({ -- Git командыг ашиглан lazy.nvim-ийг татаж суулгана
    "git",
    "clone",
    "--filter=blob:none", -- Зөвхөн шаардлагатай файлуудыг татах (хэмжээ багасгах)
    "https://github.com/folke/lazy.nvim.git", -- lazy.nvim-ийн GitHub репозитори
    "--branch=stable", -- Хамгийн сүүлийн тогтвортой хувилбарыг татах
    lazypath, -- Татсан файлыг lazypath замын дагуу хадгална
  })
end

-- lazy.nvim-ийг Neovim-ийн runtime path-д нэмэх
vim.opt.rtp:prepend(lazypath) -- lazy.nvim-ийн замыг Neovim-ийн runtime path (rtp) жагсаалтын эхэнд нэмнэ

-- lazy.nvim-ийг тохируулах
require("lazy").setup({ -- lazy.nvim-ийг ажиллуулж, plugin-уудыг дуудна
  { import = "bb.plugins" }, -- josean.plugins модулиас plugin-уудыг импортлох
  { import = "bb.plugins.lsp" }, -- josean.plugins.lsp модулиас LSP-тэй холбоотой plugin-уудыг импортлох
}, {
  checker = { -- Plugin-ийн шинэчлэл шалгагчын тохиргоо
    enabled = true, -- Шинэчлэл шалгахыг идэвхжүүлэх
    notify = false, -- Шинэчлэл байгаа тухай мэдэгдэл харуулахгүй
  },
  change_detection = { -- Файлын өөрчлөлт илрүүлэх тохиргоо
    notify = false, -- Файлын өөрчлөлт илрүүлсэн тухай мэдэгдэл харуулахгүй
  },
})
