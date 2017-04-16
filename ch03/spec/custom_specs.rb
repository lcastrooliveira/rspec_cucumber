require 'spec_helper'
require 'category'
require 'subcategory'

RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    (actual % expected) == 0
  end
end

RSpec::Matchers.define :contain_products do |*products|
  match do |category|
    subcategories_products = category.subcategories.map { |sub| sub.products }
    subcategories_products.flatten!
    expect(subcategories_products & products).to eq products
  end
  failure_message_for_should do |category|
    "expect category #{category.name} to contain products #{products}"
  end
end

describe 'The be_a_multiple_of custom matcher' do
  it 'can be used to verifiy if a number is multiple of antoher one' do
    expect(21).to be_a_multiple_of(7)
    expect(15).to be_a_multiple_of(3)
    expect(7).not_to be_a_multiple_of(3)
  end
end

describe Category do
  it 'contains all the products of its subcategories' do
    eletronics = Category.new("eletronics")
    computers = Subcategory.new("computers")
    cell_phones = Subcategory.new("cell phones")
    computers.add_product("MacBook")
    cell_phones.add_product("iPhone")

    eletronics.add_subcategories(computers, cell_phones)
    expect(eletronics).to contain_products('MacBook', 'iPhone')
  end
end
