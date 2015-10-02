module NormalizeNumbers
  module Base
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def normalize_numbers(*args)
        args.each do |attr|
          define_method("#{attr}=") do |arg|
            return super arg.tr(',', '.') if arg.is_a? String
            super
          end
        end
      end
    end
  end
end
