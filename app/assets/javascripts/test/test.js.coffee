$ ->
  window.reco = new WebSpeechRecognition()
  reco.continuous = true
  reco.statusText('status');
  reco.continuous = true;
  reco.finalResults('final_span');
  reco.interimResults('interim_span');

  Backbone.Events.on 'finalTextUpdate', ->
    $('span#final_span').html(arguments[0])
  Backbone.Events.on 'interimTextUpdate', ->
    $('span#interim_span').html(arguments[0])

  # Backbone.Events.on 'voiceTriggerInterim', ->
  #   console.log arguments[0]
  #   $('span#current').html arguments[0]