require_relative './test_helper'

class TestMixin < VirtualAssociations::Test

  def test_error_raised_when_type_defined_but_scope_not
    assert_raises RuntimeError do
      Class.new(ActiveRecord::Base).include(
        VirtualAssociations::Mixin.new(
          name: :some,
          loader: -> x {},
          type: :singular
        )
      )
    end
  end

  def test_error_raised_when_scope_and_loader_are_defined
    assert_raises RuntimeError do
      Class.new(ActiveRecord::Base).include(
        VirtualAssociations::Mixin.new(
          name: :some,
          loader: -> x {},
          scope: -> x {}
        )
      )
    end
  end
end
