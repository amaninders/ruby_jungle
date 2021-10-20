require 'rails_helper'

RSpec.describe Product, type: :model do
	
  describe 'user validations' do

    it "is valid when all the conditions are met" do
      category = Category.new()
      product = category.products.new({
        name:  'test_name',
        price: 40.0,
        quantity: 10
      })
      expect(product).to be_valid
			expect(product.errors.full_messages.length).to eq 0
    end
    
    it "is not valid without a name" do
      category = Category.new()
      product = category.products.new({
        # name:  'test_name',
        price: 40.0,
        quantity: 10
      })
      expect(product).to_not be_valid
			expect(product.errors.full_messages[0]).to eq "Name can't be blank"
    end
    
    it "is not valid without a price" do
      category = Category.new()
      product = category.products.new({
        name:  'test_name',
        # price: 40.0
        quantity: 10
      })
      expect(product).to_not be_valid
			expect(product.errors.full_messages[0]).to eq "Price cents is not a number"
    end
    
    it "is not valid without a quantity" do
      category = Category.new()
      product = category.products.new({
        name:  'test_name',
        price: 40.0
        # quantity: 10,
      })
      expect(product).to_not be_valid
			expect(product.errors.full_messages[0]).to eq "Quantity can't be blank"
    end
    
    it "is not valid without a category" do
      product = Product.new({
        name:  'test_name',
        price: 40.0,
        quantity: 10,
      })
      expect(product).to_not be_valid
			expect(product.errors.full_messages[0]).to eq "Category can't be blank"
    end

  end
end