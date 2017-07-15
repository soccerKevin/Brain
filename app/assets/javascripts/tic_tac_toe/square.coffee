@TicTacToe ||= {}
@TicTacToe.Square = class Square
  constructor: (elem)->
    @elem = $(elem)
    @click_handler()

  click_handler: ->
    @elem.on 'click', (e)=>
      @trigger 'click'

  is_free: ->
    @elem.hasClass 'free'

  set: (value)->
    @elem.find('.value').addClass value

  trigger: (event_name, data=@)->
    @elem.trigger "square.#{event_name}", data
