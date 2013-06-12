let s:save_cpo = &cpo
set cpo&vim

function! annotator#annotation#annotate()
	call annotator#prepare()
	if !isdirectory(annotator#contents_dir())
		call mkdir(annotator#contents_dir())
	endif
	execute 'split' annotator#contents_file()
	execute 'setfiletype' g:annotator#annotation#filetype
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
