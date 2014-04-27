# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  date = new Date()
  d = date.getDate()
  m = date.getMonth()
  y = date.getFullYear()
  $("#calendar").fullCalendar
    header:
      left: "prev,next today"
      center: "title"
      right: "month,agendaWeek,agendaDay"

    editable: true
    events: [
      {
        title: "Fieldtrip to Cider Mill"
        start: new Date(y, m, 1)
      }
      {
        title: "Youth Education Conference"
        start: new Date(y, m, d - 5)
        end: new Date(y, m, d - 2)
      }
      {
        id: 999
        title: "Health Inspection"
        start: new Date(y, m, d - 3, 16, 0)
        allDay: false
      }
      {
        id: 999
        title: "Andrew dropped off early"
        start: new Date(y, m, d + 4, 16, 0)
        allDay: false
      }
      {
        title: "Andrew"
        start: new Date(y, m, d, 7, 30)
        end: new Date(y, m, d, 17, 0)
        allDay: false
      }
      {
        title: "James"
        start: new Date(y, m, d, 6, 30)
        end: new Date(y, m, d, 14, 0)
        allDay: false
      }
      {
        title: "Jessica"
        start: new Date(y, m, d, 8, 30)
        end: new Date(y, m, d, 16, 0)
        allDay: false
      }
      {
        title: "Marie"
        start: new Date(y, m, d, 7, 30)
        end: new Date(y, m, d, 15, 0)
        allDay: false
      }
      {
        title: "Meeting"
        start: new Date(y, m, d, 10, 30)
        allDay: false
      }
      {
        title: "Lunch with Tamara"
        start: new Date(y, m, d+1, 12, 0)
        end: new Date(y, m, d+1, 14, 0)
        allDay: false
      }
      {
        title: "Birthday Party for Julie"
        start: new Date(y, m, d + 1, 19, 0)
        end: new Date(y, m, d + 1, 22, 30)
        allDay: false
      }
      {
        title: "Conference"
        start: new Date(y, m, 28)
        end: new Date(y, m, 29)
        url: "http://google.com/"
      }
    ]

  return
