class @TicTacToe
  constructor: (elem)->
    @elem = $(elem)
    @board = new TicTacToe.Board @elem.find '.board'
    @score_board = new TicTacToe.ScoreBoard @elem.find '.score_board'
    @score_board.set_player 1
    @square_handler()

  square_handler: ->
    @elem.on 'square.click', (e, square)->
      square.set 'x'
