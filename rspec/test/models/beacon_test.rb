require 'test_helper'

class BeaconTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "contains all properties" do
    beacon = beacons(:valid)

    assert User.new(beacon)
  end
end
