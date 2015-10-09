module NormalizeNumbers
  module Base
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def normalize_numbers(*args)
        if const_defined?(:NormalizedAttributes, false)
          mod = const_get(:NormalizedAttributes)
        else
          mod = const_set(:NormalizedAttributes, Module.new)
          prepend mod
        end

        mod.module_eval do
          args.each do |attr|
            method = "#{attr}=".to_sym
            define_method(method) do |arg|
              return super arg.tr(',', '.') if arg.is_a? String
              super arg
            end
          end
        end
      end
    end
  end
end
