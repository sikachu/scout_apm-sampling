$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "action_controller"
require "action_controller/test_case"
require "active_job"
require "active_job/test_case"
require "minitest/autorun"
require "minitest/reporters"
require "mocha/minitest"

require "scout_apm/sampling"
require "scout_apm/sampling/controller"
require "scout_apm/sampling/worker"

Minitest::Reporters.use!

ActiveSupport.on_load(:action_controller) do
  include ScoutApm::Sampling::Controller
end

ActiveSupport.on_load(:active_job) do
  include ScoutApm::Sampling::Worker
end
