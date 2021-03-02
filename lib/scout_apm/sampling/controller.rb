require_relative "callbacks"

module ScoutApm
  module Sampling
    module Controller
      include Callbacks

      def self.included(parent)
        parent.before_action :sample_requests_for_scout
      end
    end
  end
end
