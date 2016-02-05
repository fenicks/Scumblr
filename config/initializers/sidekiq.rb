#     Copyright 2016 Netflix, Inc.
#
#     Licensed under the Apache License, Version 2.0 (the "License");
#     you may not use this file except in compliance with the License.
#     You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#     Unless required by applicable law or agreed to in writing, software
#     distributed under the License is distributed on an "AS IS" BASIS,
#     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#     See the License for the specific language governing permissions and
#     limitations under the License.

require 'redis'
require 'redis-namespace'
require 'sidekiq'
require 'sidekiq-status'

redis_conn = proc do
  conn = Redis.new(url: ENV['SCUMBLR_REDIS_URL'] || 'redis://localhost:6379/0'.freeze,
                   driver: :hiredis,
                   timeout: 600,
                   reconnect_attempts: 100)
  Redis::Namespace.new(:scumblr, redis: conn)
end

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(size: Integer(ENV['SCUMBLR_REDIS_CONN_SIZE'] || 10), &redis_conn)

  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
end

Sidekiq.configure_server do |config|
  Rails.logger = Sidekiq::Logging.logger
  ActiveRecord::Base.logger = Sidekiq::Logging.logger
  Sidekiq::Logging.logger.level = Logger::INFO

  config.redis = ConnectionPool.new(size: Integer(ENV['SCUMBLR_REDIS_CONN_SIZE'] || 10), &redis_conn)

  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware, expiration: 60.minutes # default
  end
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
end
