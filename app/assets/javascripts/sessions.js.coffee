# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#calendar").fullCalendar eventSources: [
    
    # your event source
    url: "/events.json"
    type: "GET"
    data:
      custom_param1: "something"
      custom_param2: "somethingelse"

    error: ->
      alert "there was an error while fetching events!"
      return

    color: "yellow" # a non-ajax option
    textColor: "black" # a non-ajax option
  ]
  return
  