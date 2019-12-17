require 'rails_helper'

RSpec.feature "Visitor clicks on an item and is redirected to the product page", type: :feature, js: true do

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

  scenario "They click on the first product" do
    visit root_path
    expect(page).to have_css 'article.product', count: 10
    first(".btn-default").click
    expect(page).to have_css '.product-detail'
    save_screenshot 'specific_product.jpg'
  end
  
end