require "refile/simple_form"
require "refile/s3"

unless ENV["CI"] || Rails.env.development?
  aws = {
    access_key_id: ENV.fetch("AWS_ACCESS_KEY"),
    secret_access_key: ENV.fetch("AWS_SECRET_KEY"),
    bucket: ENV.fetch("AWS_BUCKET"),
    region: ENV.fetch("AWS_REGION")
  }

  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
  Refile.cdn_host = "https://#{ENV['ASSET_HOST']}" if ENV["ASSET_HOST"]
end
