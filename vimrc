call pathogen#infect()
call pathogen#helptags()
syntax enable

" Solarized colors
"For light scheme:
"set background=light

if has('gui_running')
	set background=light
else
	set background=dark
endif
colorscheme solarized

" GUI options
" disable menubar
set guioptions-=m
" disable toolbar
set guioptions-=T
