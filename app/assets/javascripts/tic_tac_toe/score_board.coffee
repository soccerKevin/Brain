@TicTacToe ||= {}
@TicTacToe.ScoreBoard = class ScoreBoard
  constructor: (elem)->
    @elem = $(elem)
    @current_player = 1

  set_player: (number)->
    console.log "setting player: #{number}"
    @current_player = number
    player = "player#{number}"
    name = @elem.find(".#{player} .name").text()
    @elem.find('.current_player')
      .removeClass('player1', 'player2')
      .addClass(player)
      .text name

  toggle_player: ->
    @set_player if @current_player == 1 then 2 else 1


