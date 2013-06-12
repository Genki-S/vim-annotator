let s:save_cpo = &cpo
set cpo&vim

function! annotator#list#setloclist()
	if !isdirectory(annotator#contents_dir())
		return
	endif
	let loclist = []
	for annotation in split(globpath(annotator#contents_dir(), '*'))
		let lnum = str2nr(matchstr(annotation, '[^/]*$'))
		let entry = {}
		let entry['filename'] = bufname('%')
		let entry['lnum'] = lnum
		let entry['text'] = readfile(annotation, '', 1)[0]
		call add(loclist, entry)
	endfor
	call setloclist(0, loclist)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
