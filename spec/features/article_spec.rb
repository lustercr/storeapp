describe "Article crud", :type => :feature do


   it "signs me in" do
    user = FactoryGirl.build(:admin_user)
    plain_password = user.password
    user.save

    login(user, plain_password)
    visit new_store_path

    expect(page).to have_content('New store')

    fill_in 'store_name', :with => 'Ebay'
    fill_in 'store_address', :with => 'eBay Park North 2211 North First Street San Jose, CA 95131'
    
    click_button 'Create Store'
    expect(page).to have_content('Store was successfully created.')
  end
end