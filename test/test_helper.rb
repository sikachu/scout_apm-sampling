$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "action_controller"
require "action_controller/test_case"
require "minitest/autorun"
require "minitest/reporters"
require "mocha/minitest"

require "scout_apm/sampling"

Minitest::Reporters.use!
