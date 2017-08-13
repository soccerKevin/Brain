class TicTacToeController < ApplicationController
  def show
    @squares = Array.new(9){ |i| 'free' }
    @brain_id = SecureRandom.uuid
    render 'tic_tac_toe/show'
  end
end
