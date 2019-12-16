require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have a first_name, last_name, email, password, and password_confirmation' do
      @user = User.new(
        :email => 'serge@serge.com',
        :first_name => 'serge',
        :last_name => 'sausage',
        :password => 'balls', 
        :password_confirmation => 'balls'
      )
      expect(@user).to be_valid
    end

    it 'should not be valid without an email' do
      @user = User.new(
        :email => nil,
        :first_name => 'serge',
        :last_name => 'sausage',
        :password => 'balls', 
        :password_confirmation => 'balls'
      )
      expect(@user).to be_invalid
    end

    it 'should not be valid without a first name' do
      @user = User.new(
        :email => 'serge@serge.com',
        :first_name => nil,
        :last_name => 'sausage',
        :password => 'balls', 
        :password_confirmation => 'balls'
      )
      expect(@user).to be_invalid
    end
    
    it 'should not be valid without a last name' do
      @user = User.new(
        :email => 'serge@serge.com',
        :first_name => 'serge',
        :last_name => nil,
        :password => 'balls', 
        :password_confirmation => 'balls'
      )
      expect(@user).to be_invalid
    end

    it 'should not be valid without a password' do
      @user = User.new(
        :email => 'serge@serge.com',
        :first_name => 'serge',
        :last_name => 'sausage',
        :password => nil, 
        :password_confirmation => 'balls'
      )
      expect(@user).to be_invalid
    end

    it 'should not be valid without a password' do
      @user = User.new(
        :email => 'serge@serge.com',
        :first_name => 'serge',
        :last_name => 'sausage',
        :password => 'balls', 
        :password_confirmation => nil
      )
      expect(@user).to be_invalid
    end

    it 'should not be valid without a password' do
      @user = User.new(
        :email => 'serge@serge.com',
        :first_name => 'serge',
        :last_name => 'sausage',
        :password => 'balls', 
        :password_confirmation => 'potato'
      )
      expect(@user).to be_invalid
    end

    it 'should not be valid if the email already exists in the database' do
      @user = User.new(
        :email => 'serge@serge.com',
        :first_name => 'serge',
        :last_name => 'sausage',
        :password => 'balls', 
        :password_confirmation => 'balls'
      )

      @user.save

      @user2 = User.new(
        :email => 'serge@serge.com',
        :first_name => 'serge',
        :last_name => 'sausage',
        :password => 'balls', 
        :password_confirmation => 'balls'
      )
      expect(@user2).to be_invalid
    end

    it 'should not be valid without a password' do
      @user = User.new(
        :email => 'serge@serge.com',
        :first_name => 'serge',
        :last_name => 'sausage',
        :password => 'bal', 
        :password_confirmation => 'bal'
      )
      expect(@user).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should still work if there is whitespace or if the case is not the same in the email' do
      @user = User.new(
        :email => 'serge@serge.com',
        :first_name => 'serge',
        :last_name => 'sausage',
        :password => 'balls', 
        :password_confirmation => 'balls'
      )

      @user.save

      expect(User.authenticate_with_credentials("  serGe@serGe.com  ", "balls")).not_to be_nil
    end
  end
end