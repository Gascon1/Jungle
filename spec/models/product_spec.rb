require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have a name, price, quantity, and category' do
      @category = Category.new(:name => 'Food')
      @product = Product.new(:name => 'balls', :price => 2000, :quantity => 32, :category => @category)

      expect(@product).to be_valid
    end

    it 'should display an error message if name is nil' do
      @category = Category.new(:name => 'Food')
      @product = Product.new(
        :name => nil, 
        :price => 2000, 
        :quantity => 32, 
        :category => @category)

      @product.save
      
      expect(@product.errors.full_messages).to eql(["Name can't be blank"])

    end

    it 'should display an error message if price is nil' do
      @category = Category.new(:name => 'Food')
      @product = Product.new(
        :name => 'balls', 
        :price => nil, 
        :quantity => 32, 
        :category => @category)

      @product.save
      
      expect(@product.errors.full_messages).to eql(["Price cents is not a number", "Price is not a number", "Price can't be blank"])

    end
    
    it 'should display an error message if quantity is nil' do
      @category = Category.new(:name => 'Food')
      @product = Product.new(
        :name => 'balls', 
        :price => 2000, 
        :quantity => nil, 
        :category => @category)

      @product.save
      
      expect(@product.errors.full_messages).to eql(["Quantity can't be blank"])

    end
    
    it 'should display an error message if category is nil' do
      @category = Category.new(:name => 'Food')
      @product = Product.new(
        :name => 'balls', 
        :price => 2000, 
        :quantity => 32, 
        :category => nil)

      @product.save
      
      expect(@product.errors.full_messages).to eql(["Category can't be blank"])

    end
  end
end