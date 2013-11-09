$ ->
  $('#login form').on 'ajax:success', (event, data, status, xhr) ->
    if data == null
      alert 'Invalid (replace with something pretty)'
    else
      window.location.href = '/dashboard'