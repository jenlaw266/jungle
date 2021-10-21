require 'rails_helper'

RSpec.feature "User click add to cart", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    
  end

  scenario "Click on product" do
    # ACT
    visit root_path
    click_button 'Add'

    # DEBUG
    # save_screenshot
    # puts page.html
    
    # VERIFY
    expect(page).to have_content('My Cart (1)')
  end

end
