# Apply settings
document.addEventListener 'settings:retrieved', (e)->
  # LANGUAGE
  do(language = e['detail']['language']) ->
    $each "#settings-language-choices a", (a)->
      a.classList.toggle 'selected', a.getAttribute('data-lang') == language

    # Language does not match up? Redirect! woo
    if language != document.querySelector('html').getAttribute('lang')
      window.location.replace document.querySelector('#settings-language-choices a.selected').getAttribute('href').replace('//', '/')

  # REGION
  do(region = e['detail']['region']) ->
    # e.g. span(data-value=region)
    $each "[data-value=region]", (el)-> el.innerHTML = region

    # REGION
    $each '#settings-region-selector option', (option, i)->
      document.getElementById('settings-region-selector').selectedIndex = i if option.text == region

  do(currency = e['detail']['currency']) ->
    $each '#settings-currency-choices a', (a)->
      a.classList.toggle 'selected', a.innerHTML.split(' ').reverse()[0] == currency['iso_code']
    $each '[data-value=currency-symbol]', (el)-> el.innerHTML = currency['html_entity']
    $each '[data-value=currency-code]',   (el)-> el.innerHTML = currency['iso_code']
    $each '[data-value=currency-name]',   (el)-> el.innerHTML = currency['name']


# Pull current settings
document.addEventListener 'settings:retrieving', ->
  retrieveCurrentSettings = new XMLHttpRequest()
  retrieveCurrentSettings.onreadystatechange = ->
    return unless retrieveCurrentSettings.readyState == XMLHttpRequest.DONE
    return unless retrieveCurrentSettings.status == 200

    document.dispatchEvent new CustomEvent('settings:retrieved', 'detail': JSON.parse(retrieveCurrentSettings.responseText))
    localStorage['settings'] = retrieveCurrentSettings.responseText

  retrieveCurrentSettings.open 'GET', $endpoint + 'settings/preferences', true
  retrieveCurrentSettings.send null


# Immediately dispatch to retrieve current settings
try
  document.dispatchEvent(new CustomEvent('settings:retrieving'))
  document.dispatchEvent(new CustomEvent('settings:retrieved', 'detail': JSON.parse(localStorage['settings'] || '{}')))
catch e
  console?.log(e)

# On settings:updated
document.addEventListener 'settings:updated', ->
  document.dispatchEvent new CustomEvent('modal:closed')
  document.dispatchEvent new CustomEvent('settings:retrieving')

# Post visitor profile
document.querySelector('.modal-footer button:last-of-type').addEventListener 'click', ->
  postCurrentSettings = new XMLHttpRequest()
  postCurrentSettings.onreadystatechange = ->
    return unless postCurrentSettings.readyState == XMLHttpRequest.DONE

    switch postCurrentSettings.status
      when 200 then document.dispatchEvent(new CustomEvent('settings:updated'))

  postCurrentSettings.open 'PATCH', $endpoint + 'settings/preferences', true
  postCurrentSettings.setRequestHeader "Content-Type", "application/json"
  postCurrentSettings.send JSON.stringify
    visitor_profile:
      currency: (-> [..., last] = document.querySelector('#settings-currency-choices a.selected').text.split(' '); last)()
      language: document.querySelector('#settings-language-choices a.selected').getAttribute('data-lang')
      region:   document.querySelector('#settings-region-selector').options[document.querySelector('#settings-region-selector').selectedIndex].value


s = (setting)-> $each "#settings-#{setting}-choices a", (a)->
  a.addEventListener 'click', (e)->
    e?.preventDefault()
    $each "#settings-#{setting}-choices a", (b)=>
      b.classList.toggle 'selected', this == b

s(setting) for setting in ['currency', 'language']


