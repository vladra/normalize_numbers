require 'test_helper'

class Product < ActiveRecord::Base
end

class ExtendedProduct < Product
  normalize_numbers :price, :tax
end

class NormalizeNumbersTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NormalizeNumbers::VERSION
  end

  def test_price_is_not_normalized
    model = Product.new(price: '12,3')
    assert_equal '12.0', model.price.to_s
  end

  def test_price_is_normalized
    model = ExtendedProduct.new(price: '12,3', tax: '4,5')
    assert_equal '12.3', model.price.to_s
    assert_equal '4.5', model.tax.to_s
  end
end
