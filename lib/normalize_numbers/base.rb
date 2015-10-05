module NormalizeNumbers
  module Base
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def normalize_numbers(*args)
        args.each do |attr|
          method_name = "#{attr}="
          define_method(method_name) do |arg|
            new_arg = arg.tr(',', '.')
            return instance_variable_set("@#{attr}", new_arg) unless defined?(super)
            return super new_arg if arg.is_a? String
            super
          end
        end
      end
    end
  end
end
