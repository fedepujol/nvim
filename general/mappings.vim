" Nvim General Mappings

" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" TAB to cycle through buffers
" nnoremap <TAB> :bnext<CR>
" nnoremap <S-TAB> :bprevious<CR>
" Remove in favour of BarBar Plugin Mapping

" Alternative Ways to
" Save
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
" Quit
nnoremap <C-q> :q<CR>
" Force Quit
nnoremap <C-S-q> :q!<CR>
" Save and Quit
nnoremap <C-S-s> :wq!<CR>

" Better Tabbing
vnoremap < <gv
vnoremap > >gv

" Better Window Nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
