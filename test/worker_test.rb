require "test_helper"
require "scout_apm/transaction"

class WorkerTest < ActiveJob::TestCase
  class TestJob < ActiveJob::Base
    self.logger = nil

    def perform; end
  end

  teardown do
    ENV.delete("SCOUT_APM_SAMPLING_RATE")
  end

  def test_sampling_with_default_sampling_rate
    expect_transaction_not_ignored
  end

  def test_sampling_based_on_environment_variable
    ENV["SCOUT_APM_SAMPLING_RATE"] = "0"

    expect_transaction_ignored
  end

  private

    def expect_transaction_ignored(&block)
      ScoutApm::Transaction.expects(:ignore!).once

      TestJob.perform_now
    end

    def expect_transaction_not_ignored(&block)
      ScoutApm::Transaction.expects(:ignore!).never

      TestJob.perform_now
    end
end
