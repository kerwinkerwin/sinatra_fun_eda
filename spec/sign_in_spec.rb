require 'spec_helper'

describe "the sign in process" , :type => :feature do
 before :all do
  @user1 = User.create(:email => 'test2@test.com', :password => '1234')
 end

 it "signs me in" do
   visit 'localhost:9393'
   within("#sign_in") do
     fill_in 'email', :with => "#{@user1.email}"
     fill_in 'password', :with => "#{@user1.password}"
   end
   click_button 'Log in'
  #  expect(page).to have_content 'hello'
 end

end
