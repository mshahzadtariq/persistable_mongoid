require 'test_helper'

class PersistableMongoidTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, PersistableMongoid
  end
end
