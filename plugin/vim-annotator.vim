if exists('g:loaded_annotator')
	finish
endif
let g:loaded_annotator = 1

let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 Annotate
		\ call annotator#annotation#annotate()
command! -nargs=0 AnnotationList
		\ call annotator#list#setloclist()

" Global options definition.
let g:annotator#annotation#directory =
		\ get(g:, 'annotator#annotation#directory', expand('~/.vim-annotation'))
let g:annotator#annotation#filetype =
		\ get(g:, 'annotator#annotation#filetype', 'markdown')

let &cpo = s:save_cpo
unlet s:save_cpo
