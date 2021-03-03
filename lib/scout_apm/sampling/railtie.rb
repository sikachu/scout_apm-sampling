require_relative "controller"
require_relative "worker"

module ScoutApm
  module Sampling
    class Railtie < Rails::Railtie
      initializer "scout_apm_sampling.set_configs" do
        ActiveSupport.on_load(:action_controller) do
          include ScoutApm::Sampling::Controller
        end

        ActiveSupport.on_load(:active_job) do
          include ScoutApm::Sampling::Worker
        end
      end
    end
  end
end
