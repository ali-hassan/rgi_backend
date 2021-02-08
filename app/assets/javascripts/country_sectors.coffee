# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  toggleGraph = ->
    visibility = $('#country_sector_graph_type').prop('value') != ''
    if visibility
      $('#country_sector_graph_text_input').show()
      $('#cke_country_sector_graph_text').prop('disabled', false)
    else
      $('#country_sector_graph_text_input').hide()
      $('#cke_country_sector_graph_text').prop('disabled', true)

  toggleGraph()
  $('#country_sector_graph_type').change -> toggleGraph()