describe "SongForm", ->
  beforeEach ->
    loadFixtures("song_form.html")
    @$el = $(".song_form")
    @view = @$el.songForm().data("song-form")

  it "disables submit button while image is uploading", ->
    $submitButton = @view.$submitButton
    @$el.trigger("upload:start")

    expect($submitButton).toHaveClass("secondary")
    expect($submitButton).toHaveProp("disabled", true)
    expect($submitButton).toHaveValue("Loading...")

  it "enables submit button when image is uploaded", ->
    $submitButton = @view.$submitButton
    @$el.trigger("upload:success")

    expect($submitButton).not.toHaveClass("secondary")
    expect($submitButton).toHaveProp("disabled", false)
    expect($submitButton).toHaveValue("Save")
