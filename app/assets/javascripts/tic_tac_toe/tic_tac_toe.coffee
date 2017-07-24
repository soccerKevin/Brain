class @TicTacToe
  constructor: (elem)->
    @elem = $(elem)
    @board = new TicTacToe.Board @elem.find '.board'
    @score_board = new TicTacToe.ScoreBoard @elem.find '.score_board'
    @square_handler()
    @new_game_handler()

  new_game: ->
    @set_current_player 1
    @board.clear()
    @elem.find('.new_game').addClass 'hidden'
    @trigger 'new_game', {
      elem: @elem,
      first_player: @current_player,
      score_board: @score_board
    }

  new_game_handler: ->
    @elem.find('.new_game').on 'click', =>
      @new_game()

  square_handler: ->
    @elem.on 'square.click', (e, square)=>
      return true unless square.is_free() && @board.in_play()
      square.set_marker @current_player_marker()
      return @display_end_game() if @board.finished()
      @toggle_player()

  display_end_game: ->
    setTimeout =>
      @elem.find('.new_game').removeClass 'hidden'
      event_name = if @board.winner then 'win' else 'draw'
      @trigger event_name, @current_player
    , 20

  current_player_marker: ->
    if @current_player == 1 then 'o' else 'x'

  toggle_player: ->
    @set_current_player if @current_player == 1 then 2 else 1

  set_current_player: (number)->
    @current_player = number
    @score_board.set_current_player @current_player
    @trigger 'player_switch', @current_player

  trigger: (event_name, data)->
    @elem.trigger "tic_tac_toe.#{event_name}", data
