class TicTacToeController < ApplicationController
  def show
    @squares = Array.new(9){ |i| 'free' }
    render 'tic_tac_toe/show'
  end
end
