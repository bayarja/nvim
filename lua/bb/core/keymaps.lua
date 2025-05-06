-- Leader товчийг тохируулах
vim.g.mapleader = "," -- Leader товчийг space (хоосон зай) болгох

-- vim.keymap-ийг товчлох
local keymap = vim.keymap -- vim.keymap-ийг keymap гэж товчлоод хялбар ашиглана

-- Insert горимоос гарах
-- keymap.set("i", "jk", "<ESC>", { desc = "jk товчоор insert горимоос гарах" }) -- Insert горимоос ESC-ийн оронд jk дарж гарах

-- Хайлтын онцлохыг арилгах
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Хайлтын онцлохыг арилгах" }) -- <leader>nh (, + nh) дарж хайлтын онцлохыг арилгах

-- Тоог нэмэх/хасах
keymap.set("n", "<leader>+", "<C-a>", { desc = "Тоог нэмэх" }) -- <leader>+ (, + +) дарж тоог нэмэх
keymap.set("n", "<leader>-", "<C-x>", { desc = "Тоог хасах" }) -- <leader>- (, + -) дарж тоог хасах

-- Цонхны удирдлага
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Цонхыг босоогоор хуваах" }) -- <leader>sv (, + sv) дарж цонхыг босоогоор хуваах
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Цонхыг хэвтээгээр хуваах" }) -- <leader>sh (, + sh) дарж цонхыг хэвтээгээр хуваах
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Хуваасан цонхнуудыг тэнцүү хэмжээтэй болгох" }) -- <leader>se (, + se) дарж хуваасан цонхнуудыг тэнцүү болгох
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Одоогийн хуваалтыг хаах" }) -- <leader>sx (, + sx) дарж одоогийн хуваалтыг хаах

-- Табын удирдлага
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Шинэ таб нээх" }) -- <leader>to (, + to) дарж шинэ таб нээх
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Одоогийн табыг хаах" }) -- <leader>tx (, + tx) дарж одоогийн табыг хаах
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Дараагийн таб руу шилжих" }) -- <leader>tn (, + tn) дарж дараагийн таб руу шилжих
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Өмнөх таб руу шилжих" }) -- <leader>tp (, + tp) дарж өмнөх таб руу шилжих
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Одоогийн буферийг шинэ табт нээх" }) -- <leader>tf (, + tf) дарж одоогийн буферийг шинэ табт нээх
