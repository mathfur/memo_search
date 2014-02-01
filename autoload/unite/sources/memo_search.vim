let s:save_cpo = &cpo
set cpo&vim

let s:source = {
            \ 'name' : 'memo_search',
            \ 'description' : 'search memo',
            \ 'default_action' : {'jump_list' : 'split'},
            \ }

function! unite#sources#memo_search#define()
  return s:source
endfunction

if !exists("g:memo_search_dirs")
  let g:memo_search_dirs = []
end

let s:candidates = []

let available_exts = ["txt", "html", "htm", "md"]

let i = 0
let s:candidates = []

while i < len(g:memo_search_dirs)
  let files = []

  let j = 0
  while j < len(available_exts)
    let files += split(glob(g:memo_search_dirs[i] . "/**/*." . available_exts[j]), '\n')

    let j = j + 1
  endwhile

  let lines = []

  let j = 0
  while j < len(files)
    let file = files[j]
    let lines = readfile(file)

    let k = 0
    while k < len(lines)
      let s:candidates = s:candidates + [{
            \ "word" : lines[k],
            \ "abbr" : printf("%s:%d:%s", file, k+1, lines[k]),
            \ "source": "lines",
            \ "kind": "jump_list",
            \ "action__path": file,
            \ "action__line": k+1
            \ }]
       let k = k + 1
    endwhile

    let j = j + 1
  endwhile

  let i = i + 1
endwhile


function! s:source.gather_candidates(args, context)
  return s:candidates
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
