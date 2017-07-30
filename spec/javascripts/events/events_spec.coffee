#= require brain/events/events

class Receiver
  constructor: ->
    @found = false

  wait_for: (event_name)->
    @e = window.Events.once event_name, =>
      @found = true

  clean: ->
    try
      window.Events.remove @e
      @e = null
    catch e

describe 'Events', ->
  beforeEach ->
    @receiver = new Receiver()

  afterEach ->
    @receiver.clean()

  describe 'strict matching', ->
    beforeEach ->
      @receiver.wait_for 'test_event'

    it 'should match with the same name', ->
      window.Events.trigger 'test_event'
      expect(@receiver.found).toBe true

    it 'should NOT match with the extra characters', ->
      window.Events.trigger 'test_event.sub_event'
      expect(@receiver.found).toBe false

  describe 'should receive a wild after', ->
    beforeEach ->
      @receiver.wait_for 'test_event*'

    it 'with the same name', ->
      window.Events.trigger 'test_event'
      expect(@receiver.found).toBe true

    it 'with sub_event', ->
      window.Events.trigger 'test_event.sub_event'
      expect(@receiver.found).toBe true

    it 'NOT with parent_event', ->
      window.Events.trigger 'parent_event.test_event'
      expect(@receiver.found).toBe false

  describe 'should receive a wild before', ->
    beforeEach ->
      @receiver.wait_for '*test_event'

    it 'with the same name', ->
      window.Events.trigger 'test_event'
      expect(@receiver.found).toBe true

    it 'with parent_event', ->
      window.Events.trigger 'parent_event.test_event'
      expect(@receiver.found).toBe true

    it 'NOT with sub_event', ->
      window.Events.trigger 'test_event.sub_event'
      expect(@receiver.found).toBe false

  describe 'wilds', ->
    it 'with parent and sub_event', ->
      @receiver.wait_for '*test_event*'
      window.Events.trigger 'parent_event.test_event.sub_event'
      expect(@receiver.found).toBe true

    it 'with mixing it all up', ->
      @receiver.wait_for 'parent_event*test_event*sub_event'
      window.Events.trigger 'parent_event.extra_event.test_event.extra_event.sub_event'
      expect(@receiver.found).toBe true

  it 'should remove an event', ->
    @receiver.wait_for 'test_event'
    window.Events.remove @receiver.e
