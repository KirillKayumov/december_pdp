class HipchatNotificationWorker
  include Sidekiq::Worker

  TOKEN = ENV.fetch("HIPCHAT_TOKEN")
  ROOM = "PDP"
  FROM = "December PDP"

  def perform(message)
    client = HipChat::Client.new(TOKEN)
    client[ROOM].send(FROM, message, notify: true)
  end
end
