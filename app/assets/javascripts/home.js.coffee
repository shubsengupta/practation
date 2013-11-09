$ ->
  $('#login form').on 'ajax:success', (event, data, status, xhr) ->
    if data == null
      alert 'Invalid login, please try again'
      window.location.reload()
    else
      window.location.href = '/dashboard'

  run = ->
    $('#logo span').addClass('translate')

  setTimeout run, 3000

  true
  