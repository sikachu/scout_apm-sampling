require "test_helper"

class ScoutApm::SamplingTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ScoutApm::Sampling::VERSION
  end
end
