# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
# vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file. JavaScript code in this file should be added after the last require_* statement.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require rails-ujs
#= require jquery3
#= require jquery_ujs
#= require names
#= require_tree ./util
#= require npc/random_npc
#= require tic_tac_toe/main
#  require brain/main

$ ->
  window.tic_tac_toe = new TicTacToe $('.tic_tac_toe')
  window.random_npc = new RandomNPC 1
  window.tic_tac_toe.new_game()
