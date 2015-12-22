require "sidekiq"
require "config_env"

ConfigEnv.path_to_config("#{__dir__}/config/config_env.rb")

Sidekiq.configure_client do |config|
  config.redis = {
    url:       ENV["REDIS_URL"],
    namespace: ENV["REDIS_NAMESPACE"],
    size:      1
  }
end

require "sidekiq/web"
run Sidekiq::Web