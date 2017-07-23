Array::first = (count=1)->
  @slice(0, count)

Array::unique = ->
  Array.from new Set @

Array::random = ->
  @[Math.floor(Math.random() * @length)]
