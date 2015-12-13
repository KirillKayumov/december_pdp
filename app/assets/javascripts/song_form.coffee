class SongForm
  constructor: (@$el) ->
    @$submitButton = @$el.find("input[type='submit']")

    @_bindEvents()

  _bindEvents: ->
    @$el.on "upload:start", @_disableSubmitButton
    @$el.on "upload:success", @_enableSubmitButton

  _disableSubmitButton: =>
    @$submitButton
      .val("Loading...")
      .addClass("secondary")
      .prop(disabled: true)

  _enableSubmitButton: =>
    @$submitButton
      .val("Save")
      .removeClass("secondary")
      .prop(disabled: false)

$.fn.songForm = ->
  return $(@).each ->
    unless $.data(@, "song-form")
      $.data(@, "song-form", new SongForm($(@)))
