require "active_support/core_ext/array/extract_options"
require "attr_boolean/version"

module AttrBoolean
  if defined? Rails::Railtie
    class Railtie < Rails::Railtie
      initializer "attr_boolean.initialize" do
        ActiveSupport.on_load :active_record do
          ActiveRecord::Base.send(:extend, AttrBoolean::ClassMethods)
        end
      end
    end
  end

  module ClassMethods
    def attr_boolean(*args)
      options = args.extract_options!
      raise ArgumentError, "cannot specify options if defining multiple boolean attributes in one call" if args.size > 1 and !options.empty?

      args.each do |boolean|
        boolean = boolean.intern

        self.class_eval { attr_accessor boolean }

        self.define_methods(boolean, options)
      end
    end

  protected
    def define_methods(name, options)
      self.class_eval do
        default = options.key?(:default) ? options[:default] : false
        
        define_method("#{name}?") do
          !!send(name)
        end

        define_method("#{name}!") do
          send("#{name}=", !default)
        end

        define_method(name) do
          if instance_variable_get("@#{name}").nil?
            default
          else
            instance_variable_get("@#{name}")
          end
        end
      end
    end
  end
end
