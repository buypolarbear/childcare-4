# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#calendar").fullCalendar
    defaultView: "agendaWeek"
    header:
      left: "prev,next today"
      center: "title"
      right: "month,agendaWeek,agendaDay"
    
    dayClick: ->
      alert "a day has been clicked!"
      return

    eventSources: [
      
      # your event source
      url: "/events.json"
      type: "GET"
      data:
        child_id: 1

      error: ->
        alert "there was an error while fetching events!"
        return

      color: "yellow" # a non-ajax option
      textColor: "black" # a non-ajax option
    ]

  return