#= require brain/events/events

class Receiver
  constructor: ->
    @found = false

    window.Events.on 'test_event', =>
      @found = true

describe 'Events', ->
  beforeEach ->
    @receiver = new Receiver()

  it 'should trigger', ->
    window.Events.trigger 'test_event'
    expect(@receiver.found).toBe true
