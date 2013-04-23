" Wrap visual selection in an HTML tag.
vmap <F12> <Esc>:call VisualHTMLTagWrap()<CR>
function! VisualHTMLTagWrap()
  "let tag = input("Tag to wrap block: ")
  let tag = "t"
  if len(tag) > 0
    normal `>
    if &selection == 'exclusive'
      exe "normal i{/".tag."}"
    else
      exe "normal a{/".tag."}"
    endif
    normal `<
    exe "normal i{".tag."}"
    normal `<
  endif
endfunction
