:: WINDOWS COQNvim FIX
:: symlink-workaround.bat
:: put this in the coq_nvim folder and run
cd /d "%~dp0"
copy  coq\clients\buffers\db\sql\create\pragma.sql coq\clients\cache\db\sql\create\pragma.sql 
copy  coq\clients\buffers\db\sql\create\pragma.sql coq\clients\registers\db\sql\create\pragma.sql 
copy  coq\clients\snippet\db\sql\create\pragma.sql coq\clients\tags\db\sql\create\pragma.sql 
copy  coq\clients\buffers\db\sql\create\pragma.sql coq\clients\tmux\db\sql\create\pragma.sql 
copy  coq\clients\buffers\db\sql\create\pragma.sql coq\clients\tree_sitter\db\sql\create\pragma.sql 
copy  coq\clients\buffers\db\sql\create\pragma.sql coq\databases\insertions\sql\create\pragma.sql 
copy coq\server\completion.lua lua\coq\completion.lua 
copy coq\lsp\requests\lsp.lua lua\coq\lsp-request.lua 
copy coq\treesitter\request.lua lua\coq\ts-request.lua 