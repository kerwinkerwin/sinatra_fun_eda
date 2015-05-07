require 'spec_helper'

describe "Capybara Fun site" , :type => :feature do
 before :all do
  @user1 = User.create(:email => 'test@test.com', :password => '123')
 end

   it "signs me in" do
     visit 'localhost:9393'
     within("#sign_in") do
       fill_in 'email', :with => "#{@user1.email}"
       fill_in 'password', :with => "#{@user1.password}"
     end
     click_button 'Log in'
     expect(page).to have_content "hello"
   end
end
# describe "sign out process"
#    it "signs me out" do
#      visit 'localhost:9393'
#      within("#sign_in") do
#        fill_in 'email', :with => "#{@user1.email}"
#        fill_in 'password', :with => "#{@user1.password}"
#      end
#      click_button 'Log in'
#      click_button 'Log out'
#      expect(page).to have_content "Email"
#    end
#  end
