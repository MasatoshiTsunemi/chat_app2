document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: $('#messages').data('room_id') },
    connected: ->

    disconnected: ->

    received: (data) ->
      console.log("recieved")
      console.log(data)
      $('#messages').append data['message']

    speak: (message)->
      console.log("message")
      console.log(message)
      @perform 'speak', message: message

  $(document).on 'keypress', '[data-behavior=room_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
