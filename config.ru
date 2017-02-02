require "sidekiq"
require "sidekiq/web"
require "config_env"

ConfigEnv.path_to_config("#{__dir__}/config/config_env.rb")

Sidekiq.configure_client do |config|
  config.redis = {
    url:       ENV["REDIS_URL"],
    size:      1
  }
end

map "/" do
  use Rack::Auth::Basic, "Protected Area" do |username, password|
    username == ENV["USERNAME"] && password == ENV["PASSWORD"]
  end

  run Sidekiq::Web
end
