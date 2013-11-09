$ ->
  window.reco = new WebSpeechRecognition()
  reco.continuous = true
  reco.maxAlternatives = 10

  reco.finalResults('final_span');
  reco.interimResults('interim_span');
  last_text = ''
  Backbone.Events.on 'finalTextUpdate', ->
    if last_text != arguments[0]
      $('span#final_span').html(arguments[0])
      last_text = arguments[0]
  Backbone.Events.on 'interimTextUpdate', ->
    $('span#interim_span').html(arguments[0])

  $('button#startButton').click (e) ->
    text_map = $('textarea#input').val().trim().replace(/[\.,-\/#!$%\^&\*;:{}=\-_`~()]/g,"").replace(/\s{2,}/g," ")
    $('#solid').text(text_map)

    $('textarea#input').hide()
    reco.toggleStartStop() 
