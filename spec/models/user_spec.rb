require 'rails_helper'

RSpec.describe User, type: :model do

	describe "user validations" do
		
		subject(:my_first_user) {
			described_class.new( email: "user@user.com",
			name: "cap",
			password: "bucky",
			password_confirmation: "bucky")
		}
		
		subject(:my_second_user) {
			described_class.new( email: "user@user.com",
			name: "tchala",
			password: "vision",
			password_confirmation: "vision")
		}

		it "requires email" do
			my_first_user.email = nil
			expect(my_first_user).to_not be_valid
			expect(my_first_user.errors.full_messages[0]).to eq "Email can't be blank"
		end
		
		it "requires name" do
			my_first_user.name = nil
			expect(my_first_user).to_not be_valid
			expect(my_first_user.errors.full_messages[0]).to eq "Name can't be blank"
		end
		
		it "requires password" do
			my_first_user.password = nil
			expect(my_first_user).to_not be_valid
			expect(my_first_user.errors.full_messages[0]).to eq "Password can't be blank"
		end
		
		
		it "requires password length 3 or more" do
			my_first_user.password = '12'
			my_first_user.password_confirmation = '12'
			expect(my_first_user).to_not be_valid
			expect(my_first_user.errors.full_messages[0]).to eq "Password 3 characters is the minimum required"
		end
		
		it "requires password_confirmation field" do
			my_first_user.password_confirmation = nil
			expect(my_first_user).to_not be_valid
		end	
		
		it "requires that password matches password_confirmation" do
			my_first_user.password_confirmation = 'test'
			expect(my_first_user).to_not be_valid
		end
		
		it "ensures that the email is unique and not used already" do
			my_first_user.save
			expect(my_second_user).to_not be_valid
			expect(my_second_user.errors.full_messages[0]).to eq "Email has already been taken"
		end
		
		it "is valid when all the properties are good" do
			expect(my_first_user).to be_valid
		end		
	end

	describe '.authenticate_with_credentials' do
		
		subject(:my_first_user) {
			described_class.new( email: "user@user.com",
			name: "cap",
			password: "bucky",
			password_confirmation: "bucky")
		}
		
    it "fails login when wrong email" do
			@user = User.new(email: "user@user.com",
											 name: "aman",
											 password: "password",
											 password_confirmation: "password")
      @user.save!
      expect(User.authenticate_with_credentials("myuser@user.com", "password")).not_to be_present
		end
		
		it "fails login when wrong password" do
			@user = User.new(email: "user@user.com",
											 name: "aman",
											 password: "password",
											 password_confirmation: "password")
      @user.save!
      expect(User.authenticate_with_credentials("user@user.com", "mypassword")).not_to be_present
		end
		
		it "takes email address with spaces" do
			@user = User.new(email: "user@user.com",
											 name: "aman",
											 password: "password",
											 password_confirmation: "password")
      @user.save!
      expect(User.authenticate_with_credentials(" user @user.com ", "mypassword")).not_to be_present
		end
		
		it "takes email address in uppercase" do
			@user = User.new(email: "user@user.com",
											 name: "aman",
											 password: "password",
											 password_confirmation: "password")
      @user.save!
      expect(User.authenticate_with_credentials(" USER @user.COM ", "mypassword")).not_to be_present
		end
		
  end

end