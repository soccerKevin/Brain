@TicTacToe ||= {}
@TicTacToe.Square = class Square
  constructor: (elem)->
    @elem = $(elem)
    @click_handler()

  click_handler: ->
    @elem.on 'click', (e)=>
      @trigger 'click'
      false

  is_free: ->
    @elem.find('.value').hasClass 'free'

  taken: ->
    !@is_free()

  set_marker: (value)->
    @elem.find('.value').removeClass('free').addClass value

  marker: ->
    @elem.find('.value').attr('class').replace 'value ', ''

  value: ->
    @marker()

  clear: ->
    @elem.find('.value').removeClass('x o').addClass 'free'

  trigger: (event_name, data=@)->
    @elem.trigger "square.#{event_name}", data
