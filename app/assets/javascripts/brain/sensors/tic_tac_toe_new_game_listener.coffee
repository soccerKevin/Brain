class @TicTacToeNewGameSensor extends Sensor
  wait_for: ->
    $(document).on 'tic_tac_toe.new_game', (e, game_data)=>
      window.Brain._this {
        type: 'tic_tac_toe'
        game_data: game_data
      }
