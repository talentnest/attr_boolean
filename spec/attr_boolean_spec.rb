require 'attr_boolean'

class BooleanAttr
  extend AttrBoolean::ClassMethods
  attr_boolean :bool
end

class MultipleBooleanAttrs
  extend AttrBoolean::ClassMethods
  attr_boolean :bool, :bool2
end

class DefaultBooleanAttr
  extend AttrBoolean::ClassMethods
  attr_boolean :bool, :default => true
end

describe AttrBoolean do
  it "should define methods" do
    klass = BooleanAttr.new
    klass.respond_to?(:bool).should be_true
    klass.respond_to?(:bool=).should be_true
    klass.respond_to?(:bool!).should be_true
    klass.respond_to?(:bool?).should be_true
  end

  it "should set a default value of false if not specified" do
    klass = BooleanAttr.new
    klass.bool.should be_false
  end

  it "should set up a predicate" do
    klass = BooleanAttr.new
    klass.bool = true
    klass.should be_bool
    klass.bool = false
    klass.should_not be_bool
  end

  it "should set up a bang method which changes the value to the opposite of the default" do
    klass = BooleanAttr.new
    klass.bool!
    klass.should be_bool

    klass = DefaultBooleanAttr.new
    klass.bool!
    klass.should_not be_bool
  end

  it "should define multiple boolean attributes if more than one is specified" do
    klass = MultipleBooleanAttrs.new
    klass.respond_to?(:bool).should be_true
    klass.respond_to?(:bool2).should be_true
  end

  it "should set a default value if given" do
    klass = DefaultBooleanAttr.new
    klass.bool.should be_true
  end
end