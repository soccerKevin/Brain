class @TicTacToeTurnSensor extends Sensor
  wait_for: ->
    $(document).on 'tic_tac_toe.player_switch', (e, current_player_number)=>
      window.Brain._this {
        type: 'tic_tac_toe'
        data: data
      }

