$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rails/all'
require 'normalize_numbers'

require 'minitest/autorun'

ActiveRecord::Base.send(:include, NormalizeNumbers::Base)

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Base.connection.create_table :products do |t|
  t.float :price
  t.decimal :tax
end
