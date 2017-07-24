@TicTacToe ||={}
@TicTacToe.Board = class Board
  constructor: (elem)->
    @elem = $(elem)
    @winner = false
    @squares()

  squares: ->
    @squares_cache ||= @elem.find('.square').get().map (square_elem)->
      new TicTacToe.Square square_elem

  square: (index)->
    @squares()[index]

  square_value: (index)->
    @squares()[index].value()

  finished: ->
    @complete = @has_complete_set() || @filled()

  in_play: ->
    !@finished()

  filled: ->
    @squares().filter((square)-> square.taken()).length >= 9

  clear: ->
    @squares().map (square)-> square.clear()
    @winner = false

  has_complete_set: ->
    @sets().filter((set)=>
      values = set.map (index)=> @square(index).value()

      return false if values.includes 'free'
      return false unless values.unique().length == 1

      @winner = values.first()
    ).length > 0

  sets: ->
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
