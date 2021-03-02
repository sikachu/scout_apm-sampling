require "action_controller/base"
require "active_job/base"
require "scout_apm/transaction"
require_relative "sampling/controller"
require_relative "sampling/worker"
require_relative "sampling/version"

ActionController::Base.include ScoutApm::Sampling::Controller
ActiveJob::Base.include ScoutApm::Sampling::Worker
