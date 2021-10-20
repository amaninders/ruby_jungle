require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  # SETUP
	before :each do
			User.create!(
				name:  'someuser' ,
				email: 'someuser@email.com',
				password: 'test',
				password_confirmation: 'test'
			)
	end

	scenario "User logs in successfully" do
		# ACT
		visit root_path	
    click_link('Login')
		page.fill_in 'email', with: 'someuser@email.com'
		page.fill_in 'password', with: 'test'
		click_button('Login')

		# DEBUG / VERIFY
		save_screenshot
		expect(page).to have_content("Signed in as someuser")
	end
end
