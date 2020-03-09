
let g:grammarous#show_first_error = 1
let g:grammarous#move_to_first_error = 0

"let g:grammarous#use_vim_spelllang = 1
let g:grammarous#use_vim_spelllang = 0
let g:grammarous#enable_spell_check = 1
set spelllang=en_gb
let loaded_spellfile_plugin = 1
syntax spell toplevel
command GrammarCheck GrammarousCheck
command GrammarReset GrammarousReset
