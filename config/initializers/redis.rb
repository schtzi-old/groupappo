# $redis = Redis.new

# if ENV["REDISCLOUD_URL"]
#   url = ENV["REDISCLOUD_URL"]
# else
#   url = "redis://localhost:3000/1"
# end

# if url
#   Sidekiq.configure_server do |config|
#     config.redis = { url: url }
#   end

#   Sidekiq.configure_client do |config|
#     config.redis = { url: url }
#   end
#   $redis = Redis.new(:url => url)
# end
