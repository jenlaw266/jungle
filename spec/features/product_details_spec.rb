require 'rails_helper'

RSpec.feature "Users navigate from home page to product detail page", type: :feature, js: true do
  
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
    find('.product header h4').click

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_current_path(product_path(@category.products.last.id))
  end

end
