return { -- Plugin-ийн тохиргоог буцаах
  "folke/tokyonight.nvim", -- tokyonight colorscheme plugin
  priority = 1000, -- Plugin-ийн ачааллын дарааллыг өндөр болгох (colorscheme эрт ачааллагдана)
  config = function() -- Plugin-ийн тохиргооны функц
    -- Тунгалаг байдлын тохиргоо
    local transparent = false -- Тунгалаг байдлыг идэвхжүүлэх бол true, идэвхгүй бол false

    -- Өнгөний утгуудыг тодорхойлох (hex код)
    local bg = "#011628" -- Үндсэн арын өнгө
    local bg_dark = "#011423" -- Илүү бараан арын өнгө
    local bg_highlight = "#143652" -- Онцлох арын өнгө
    local bg_search = "#0A64AC" -- Хайлтын онцлох өнгө
    local bg_visual = "#275378" -- Сонгогдсон хэсгийн арын өнгө
    local fg = "#CBE0F0" -- Үндсэн текстийн өнгө
    local fg_dark = "#B4D0E9" -- Бага зэрэг бараан текстийн өнгө
    local fg_gutter = "#627E97" -- Мөрний дугаарлалтын өнгө (gutter)
    local border = "#547998" -- Хүрээний өнгө

    -- tokyonight colorscheme-ийг тохируулах
    require("tokyonight").setup({ -- tokyonight-ийн тохиргооны функцыг дуудах
      style = "night", -- Colorscheme-ийн загварыг "night" (бараан) болгох
      transparent = transparent, -- Тунгалаг байдлын тохиргоог ашиглах
      styles = { -- Янз бүрийн элементүүдийн загварыг тодорхойлох
        sidebars = transparent and "transparent" or "dark", -- Хажуугийн самбаруудыг тунгалаг эсвэл бараан болгох
        floats = transparent and "transparent" or "dark", -- Хөвөгч цонхнуудыг тунгалаг эсвэл бараан болгох
      },
      on_colors = function(colors) -- Өнгөний тохиргоог өөрчлөх функц
        colors.bg = bg -- Арын өнгө
        colors.bg_dark = transparent and colors.none or bg_dark -- Бараан арын өнгө (тунгалаг бол "none")
        colors.bg_float = transparent and colors.none or bg_dark -- Хөвөгч цонхны арын өнгө
        colors.bg_highlight = bg_highlight -- Онцлох арын өнгө
        colors.bg_popup = bg_dark -- Popup цонхны арын өнгө
        colors.bg_search = bg_search -- Хайлтын онцлох өнгө
        colors.bg_sidebar = transparent and colors.none or bg_dark -- Хажуугийн самбарын арын өнгө
        colors.bg_statusline = transparent and colors.none or bg_dark -- Статусын мөрний арын өнгө
        colors.bg_visual = bg_visual -- Сонгогдсон хэсгийн арын өнгө
        colors.border = border -- Хүрээний өнгө
        colors.fg = fg -- Үндсэн текстийн өнгө
        colors.fg_dark = fg_dark -- Бараан текстийн өнгө
        colors.fg_float = fg -- Хөвөгч цонхны текстийн өнгө
        colors.fg_gutter = fg_gutter -- Мөрний дугаарлалтын өнгө
        colors.fg_sidebar = fg_dark -- Хажуугийн самбарын текстийн өнгө
      end,
    })

    -- Colorscheme-ийг идэвхжүүлэх
    vim.cmd("colorscheme tokyonight") -- tokyonight colorscheme-ийг идэвхжүүлэх
  end,
}
