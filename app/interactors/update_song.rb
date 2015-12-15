class UpdateSong
  include Interactor

  delegate :song, to: :context

  def call
    notify if song.save
  end

  private

  def notify
    HipchatNotificationWorker.perform_async("#{song.decorate.short_info} has been updated!")
  end
end
