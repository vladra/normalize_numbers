require 'rails'

require 'normalize_numbers/base'

module NormalizeNumbers
  class Railtie < Rails::Railtie
    initializer 'normalize_numbers' do
      ActiveRecord::Base.send(:include, NormalizeNumbers::Base)
    end
  end
end
