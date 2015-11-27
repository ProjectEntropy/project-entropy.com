# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


window.Entropy = {}
exports = Entropy

Entropy.load_stats = () ->
  $.getJSON "/crowdfund_data/btc", (data) ->
    $('#total_raised').html(data.total_raised)

  $.getJSON "/crowdfund_data/asset", (data) ->
    $('#backers').html(data.total_backers)

$(document).ready( Entropy.load_stats )
$(document).on('page:load', Entropy.load_stats )
