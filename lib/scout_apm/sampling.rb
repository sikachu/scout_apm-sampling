require "action_controller/base"
require "scout_apm/transaction"
require_relative "sampling/controller"
require_relative "sampling/version"

ActionController::Base.include ScoutApm::Sampling::Controller
