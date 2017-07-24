class @RandomNPC
  constructor: (@player_number)->
    @name = @random_name()
    @new_game_listener()
    @my_turn_listener()

  random_name: ->
    window.first_names.random()

  new_game_listener: ->
    $(document).on 'tic_tac_toe.new_game', (e, game_data)=>
      @board_elem = game_data.elem
      game_data.score_board.set_player_name @player_number, @name
      @take_turn() if game_data.first_player == @player_number

  my_turn_listener: ->
    $(document).on 'tic_tac_toe.player_switch', (e, current_player_number)=>
      @take_turn() if @board_elem? && current_player_number == @player_number

  take_turn: ->
    $(@board_elem.find('.square .value.free').get().random()).click()

