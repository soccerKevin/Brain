class @Events
  constructor: ->
    @events = {}

  trigger: (event_name, data)->
    @event_matches(event_name).map (e)->
      e.callback event_name, data
      @remove e if -1000 < e.times-- < 0

  on: (event_matcher, callback, times=-1000)->
    e = new E event_matcher, callback, times
    @events[e.id] = e

  once: (event_matcher, callback)->
    @on event_matcher, callback, 1

  @remove: (e)->
    delete @events[e.id]

  event_matches: (event_name)->
    matches = []
    for own id, e of @events
      matches.push e if e.matches event_name
    matches

  class E
    constructor: (@matcher, @callback, @times)->
      @id = window.uid()

    matches: (event_name)->
      @matcher.includes event_name

window.Events = new Events()
