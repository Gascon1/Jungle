require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(5),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "The cart updates when a user adds an item to the cart" do
    visit root_path
    
    within first('.product') do 

      click_button 'Add'

    end
    save_screenshot 'cart.jpg'
    
    within 'nav' do 

      expect(page).to have_text(' My Cart (1)')

    end


  end

end
