#= require turbolinks
#= require_tree ./vendor
#= require_self
#= require_tree ./lib

window.$each = (selector, block)-> [].forEach.call(document.querySelectorAll(selector), block)

# API endpoint
window.$endpoint = document.querySelector('meta[name=api-endpoint]').getAttribute('content')

Turbolinks.enableProgressBar()

