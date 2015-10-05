require 'test_helper'

class Product < ActiveRecord::Base
end

class ExtendedProduct < Product
  attr_accessor :other_price
  normalize_numbers :price, :tax, :other_price
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
    model = ExtendedProduct.new(price: '12,3', tax: '4,5', other_price: '6,7')
    assert_equal '12.3', model.price.to_s
    assert_equal '4.5', model.tax.to_s
    assert_equal '6.7', model.other_price.to_s
  end
end
