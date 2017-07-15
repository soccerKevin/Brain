@TicTacToe ||={}
@TicTacToe.Board = class Board
  constructor: (elem)->
    @elem = $(elem)
    @squares()

  squares: ->
    @squares_cache ||= @elem.find('.square').get().map (square_elem)->
      new TicTacToe.Square square_elem
