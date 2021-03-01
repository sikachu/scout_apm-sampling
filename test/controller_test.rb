require "test_helper"

class ControllerTest < ActionController::TestCase
  class TestController < ActionController::Base
    def index
      head :ok
    end
  end

  tests TestController

  setup do
    @routes = ActionDispatch::Routing::RouteSet.new
    @routes.draw { get "index" => "controller_test/test#index" }
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

      get :index
    end

    def expect_transaction_not_ignored(&block)
      ScoutApm::Transaction.expects(:ignore!).never

      get :index
    end
end
