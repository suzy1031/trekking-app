# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

# config.ru
if ENV['RAILS_ENV'] == 'production'
  require 'unicorn/worker_killer'
  use Unicorn::WorkerKiller::MaxRequests, 3072, 4096, true
  use Unicorn::WorkerKiller::Oom, (192*(1024**2)), (256*(1024**2)), 16
end
