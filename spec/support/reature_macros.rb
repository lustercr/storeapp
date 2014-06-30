module FeatureMacros
  def login(user, plain_password)
    visit login_path
    expect(page).to have_content 'Login'
    fill_in 'email', :with => user.email
    fill_in 'password', :with => plain_password
    click_button 'Sign In'
    expect(page).to have_content('Successfully logged in')
  end
end