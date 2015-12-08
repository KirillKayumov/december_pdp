class SearchSongs
  include Interactor

  MAIN_PARAMS = %i(
    title
    artist
    lyrics
    release_date
    rating
  )

  BOOLEAN_PARAMS = %i(
    single
  )

  delegate :songs, :songs=, to: :context
  delegate :params, to: :context

  before do
    self.songs = Song.all
    filter_params
  end

  def call
    search_by_main_params
    search_by_boolean_params
  end

  private

  def search_by_main_params
    main_params.each do |key, value|
      self.songs = songs.public_send("with_#{key}", value)
    end
  end

  def search_by_boolean_params
    boolean_params.each_key do |key|
      self.songs = songs.public_send(key)
    end
  end

  def main_params
    @_main_params ||= params.select { |key, _| MAIN_PARAMS.include?(key.to_sym) }
  end

  def boolean_params
    @_boolean_params ||= params.select { |key, _| BOOLEAN_PARAMS.include?(key.to_sym) }
  end

  def filter_params
    params.delete_if { |_, value| value.blank? }
  end
end
