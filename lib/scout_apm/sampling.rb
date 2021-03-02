require "scout_apm/transaction"
require_relative "sampling/version"

module ScoutApm
  module Sampling
    DEFAULT_SCOUT_APM_SAMPLING_RATE = 1.0

    def self.included(parent)
      parent.before_action :sample_requests_for_scout
    end

    private

      def sample_requests_for_scout
        if rand >= scout_apm_sampling_rate
          ScoutApm::Transaction.ignore!
        end
      end

      def scout_apm_sampling_rate
        sampling_rate = ENV["SCOUT_APM_SAMPLING_RATE"]

        if sampling_rate.to_s =~ /\A0?\.?[0-9]+\z/
          sampling_rate.to_f
        else
          DEFAULT_SCOUT_APM_SAMPLING_RATE
        end
      end
  end
end

ActionController::Base.include ScoutApm::Sampling
