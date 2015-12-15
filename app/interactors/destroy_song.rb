class DestroySong
  include Interactor

  delegate :song, to: :context

  def call
    song.destroy
    notify
  end

  private

  def notify
    HipchatNotificationWorker.perform_async("#{song.decorate.short_info} has been deleted!")
  end
end
