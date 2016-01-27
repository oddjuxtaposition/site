# Click a modal link to open modal
$each 'a[href^="#"]', (a)->
  a.addEventListener 'click', (e)->
    e.preventDefault()
    e.stopPropagation() # Do not immediately close modal
    a.blur() # Because the focus effect

    document.querySelector('body').classList.add 'modalized'
    
    $each '.modal > a', (tab)->
      tab.classList.toggle 'viewing', tab.getAttribute('href') == a.getAttribute('href')

    $each '.modal > div:not(.modal-footer)', (content)->
      content.classList.toggle 'viewing', content.getAttribute('id') == a.getAttribute('href').substring(1)

document.addEventListener 'modal:closed', ->
  document.querySelector('body').classList.remove 'modalized'
  
# Click outside modal to close modal
document.querySelector('body').addEventListener 'click', (e)->
  return if e.target.classList.contains('modal')
      
  while el = (el || e.target).parentNode
    return if el.classList?.contains('modal')

  document.querySelector('body').classList.remove 'modalized'

# Press esc to close modal
document.addEventListener 'keydown', (e)->
  if e.keyCode == 27 # esc
    document.querySelector('body').classList.remove 'modalized'

# Press cancel to close modal
document.querySelector('[data-dismiss]').addEventListener 'click', (e)->
  document.querySelector('body').classList.remove 'modalized'

