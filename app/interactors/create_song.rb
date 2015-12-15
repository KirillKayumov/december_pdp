class CreateSong
  include Interactor

  delegate :song, to: :context

  def call
    song.user = context.current_user
    notify if song.save
  end

  private

  def notify
    HipchatNotificationWorker.perform_async("#{song.decorate.short_info} has been added!")
  end
end
