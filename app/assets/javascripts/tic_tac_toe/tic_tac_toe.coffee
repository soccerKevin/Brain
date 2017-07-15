class @TicTacToe
  constructor: (elem)->
    @elem = $(elem)
    @board = new TicTacToe.Board @elem.find '.board'
    @square_handler()

  square_handler: ->
    @elem.on 'square.click', (e, square)->
      square.set 'x'
