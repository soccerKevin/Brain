class @RandomNPC
  constructor: (@player_number)->
    @random_name()
    @new_game_listener()
    @my_turn_listener()

  random_name: ->
    @name = window.first_names.random()

  new_game_listener: ->
    $(document).on 'tick_tac_toe.new_game', (e, game_data)=>
      @board_elem = game_data.elem
      @take_turn() if game_data.first_player = @player_number

  my_turn_listener: ->
    $(document).on 'tic_tac_toe.player_switch', (e, current_player_number)=>
      @take_turn() if current_player_number = @player_number

  take_turn: ->
    alert 'taking a turn'

