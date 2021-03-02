require_relative "callbacks"

module ScoutApm
  module Sampling
    module Worker
      include Callbacks

      def self.included(parent)
        parent.before_perform :sample_requests_for_scout
      end
    end
  end
end
