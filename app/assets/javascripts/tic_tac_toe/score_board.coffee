@TicTacToe ||= {}
@TicTacToe.ScoreBoard = class ScoreBoard
  constructor: (elem)->
    @elem = $(elem)
    @current_player = 1
    @win_handler()
    @draw_handler()

  set_current_player: (number)->
    @current_player = number
    @elem.find('.current_player')
      .removeClass('player1 player2')
      .addClass("player#{number}")
      .text @player_name number

  set_player_name: (number, name)->
    @elem.find(".player#{number} .name").text name

  player_name: (number)->
    @elem.find(".player#{number} .name").text()

  toggle_player: ->
    @set_current_player if @current_player == 1 then 2 else 1

  win_handler: ->
    $(document).on 'tic_tac_toe.win', (e, winner)=>
      @elem.find('.current_player').text "#{@player_name winner } won!"

  draw_handler: ->
    $(document).on 'tic_tac_toe.draw', (e)=>
      @elem.find('.current_player').text "Cat's game, ¯\\\_(ツ)_/¯"
