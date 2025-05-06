-- netrw-ийн загварыг тохируулах
vim.cmd("let g:netrw_liststyle = 3") -- netrw файлын хөтчийг модны загвараар (tree style) харуулна

-- vim.opt-ийг товчлох
local opt = vim.opt -- vim.opt-ийг opt гэж товчлоод хялбар ашиглана
local g = vim.g -- global хувьсагч 

opt.mouse = "a"

opt.background = "dark"
opt.encoding = "utf-8"
-- Курсорын тохиргоо
opt.cursorline = true -- Курсор байгаа мөрийг онцлох

-- Мөрний дугаарлалтын тохиргоо
opt.relativenumber = true -- Харьцангуй мөрний дугаар харуулах (жишээ нь, курсороос хэдэн мөр дээш/доош)
opt.number = true -- Мөрний дугаарыг харуулах

-- Tab ба indent-ийн тохиргоо
opt.tabstop = 2 -- Tab-ын хэмжээг 2 хоосон зай болгох (Prettier-ийн стандарт)
opt.shiftwidth = 2 -- Автомат indent-ийн хэмжээг 2 хоосон зай болгох
opt.softtabstop = 2      -- таб эсвэл задлах үед ашиглах зай
opt.expandtab = true -- Tab-ыг хоосон зай болгон хөрвүүлэх
opt.autoindent = true -- Шинэ мөр эхлэхэд өмнөх мөрний indent-ийг хуулах

-- Таб мөрүүд илэрхийлэх
opt.showtabline = 2      -- таб мөр үргэлж харуулах

-- Тушаал Suggest харуулах тохиргоо
vim.opt.shortmess:append({ W = true, I = true, c = true })  -- зарим бичиг дохио үзүүлэхийг хаах

-- Хавчиганалтанд үзүүлэх тэмдэг
vim.opt.fillchars:append("fold:•")  -- хавчилгах тэмдгийг цэгээр
opt.foldlevel = 99       -- бүх хавчилсан хэсгийг дэлгэх түвшин
opt.foldlevelstart = -1  -- баруун талаас өгсөн түвшнээр бусад нь хадгалахгүй
opt.foldmethod = "expr" -- хавчлагын аргыг илэрхийллийн хувьд
opt.foldexpr = "nvim_treesitter#foldexpr()"  -- Tree-sitter ашиглан хавчлах

-- Мөр хуваах тохиргоо
opt.wrap = false -- Урт мөрүүдийг автоматаар хуваахгүй (нэг мөрөнд үргэлжилнэ)

-- Хайлтын тохиргоо
opt.ignorecase = true -- Хайлт хийхдээ том/жижиг үсгийг ялгахгүй
opt.smartcase = true -- Хэрвээ хайлтад том/жижиг үсэг холилдсон бол том/жижиг үсгийг ялгана


-- Colorscheme-ийн тохиргоо
opt.termguicolors = true -- True color дэмжлэгийг идэвхжүүлэх (tokyonight colorscheme-д шаардлагатай)
opt.signcolumn = "yes" -- Тэмдгийн баганыг үргэлж харуулах (текст гулсахаас сэргийлнэ)
-- Swapfile-ийн тохиргоо
opt.swapfile = false -- Swapfile-г идэвхгүй болгох (нөөц файл үүсгэхгүй)
opt.backup = false       -- backup файл үүсгэхгүй
opt.writebackup = false  -- бичихэд backup үүсгэхгүй

-- Автомат төлөвлөгч (wildmenu)
opt.wildmode = "longest:full,full"  -- таах үйлдлийн горим

-- Хонх дуугаралт болон мөр багасгах
opt.winminwidth = 5       -- цонхны хамгийн бага өргөн
opt.updatetime = 100      -- CursorHold болон swap файл бичих хоорондох хугацаа

-- Undo тохиргоонууд
opt.undofile = true                              -- undo түүхийг файлд хадгалах
opt.undodir = vim.fn.expand("~/.nvim/undo")     -- undo файлын директор
opt.undolevels = 10000                           -- undo түвшинүүдийн тоо

-- Backspace-ийн тохиргоо
opt.backspace = "indent,eol,start" -- Backspace-г indent, мөрний төгсгөл, оруулах горимын эхэнд ашиглахыг зөвшөөрнө

opt.errorbells = false     -- алдаа дохио дуугаралт 
opt.completeopt = "menu,menuone,noselect"  -- autocomplete түүхийн тохиргоо

opt.conceallevel = 0       -- Markdown нууцлагдсан текстийг харуулах
opt.formatoptions = "jcroqlnt"  -- форматлах горим 

-- Статус мөр болон Popup
opt.laststatus = 0        -- статус мөр харуулах эсэх (0=хаах)
opt.pumblend = 10         -- popup-ийн тунгалаг байдал
opt.pumheight = 20        -- popup-ийн хамгийн их урт

-- grep тохиргоо
opt.grepformat = "%f:%l:%c:%m"  -- grep үр дүнгийн формат
opt.grepprg = "rg --vimgrep"   -- ripgrep ашиглах

-- Clipboard-ийн тохиргоо
opt.clipboard:append("unnamedplus") -- Системийн clipboard-ийг үндсэн register болгон ашиглана

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Buffer нээх үед бүх folds-ыг дахин тохируулах
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  command = "normal zx"      -- бүх хавчилсан хэсгийг цэвэрлэх
})

-- Цонх хуваах тохиргоо
opt.splitright = true -- Шинэ босоо цонхыг баруун талд нээх
opt.splitbelow = true -- Шинэ хэвтээ цонхыг доод талд нээх

