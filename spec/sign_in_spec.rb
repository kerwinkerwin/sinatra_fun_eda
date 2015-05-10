require 'spec_helper'

describe "sign-in" , :type => :feature do
 before do
  @user1 = User.create(:email => 'test@test.com', :password => '123')
 end
 context "with valid information" do
   it "signs me in" do
     visit 'localhost:9393'
     within("#sign_in") do
       fill_in 'email', :with => "#{@user1.email}"
       fill_in 'password', :with => "#{@user1.password}"
     end
     click_button 'Log in'
     expect(page).to have_css("#sign_out")
   end
 end

 context "with invalid information" do
   it "does not sign in" do
     visit 'localhost:9393'
     within("#sign_in") do
       fill_in 'email', :with => "#{@user1.email}"
       fill_in 'password', :with => "1234"
     end
   click_button 'Log in'
   expect(page).to have_content "wrong credentials"
   end
 end
end

describe "sign out process", :type=> :feature do
  before do
   @user1 = User.create(:email => 'test@test.com', :password => '123')
  end
   it "signs me out" do
     visit 'localhost:9393'
     within("#sign_in") do
       fill_in 'email', :with => "#{@user1.email}"
       fill_in 'password', :with => "#{@user1.password}"
     end
     click_button 'Log in'
     click_button 'Log out'
     expect(page).to have_content "Email"
   end
 end

 describe "sign up process", :type=> :feature do
   before do
    visit "localhost:9393"
   end
   xit "redirects to sign up page" do
     click_button 'Sign up'
     expect(page).to have_content "Sign up"
   end
 end

 describe "sign up process", :type=> :feature do
   before do
    visit "localhost:9393"
    click_button 'Sign up'

   end
   context "with valid information" do
     it "creates a user" do
       within("#sign_up") do
         fill_in 'email', :with=>'onemore@more.com'
         fill_in 'password', :with=>'123'
       end
       click_button 'Sign up'
       expect(page).to have_content "hello"
     end
   end
   context "with a user already in db" do
     it "sends an error message" do
       within("#sign_up") do
         fill_in 'email', :with=>'test@test.com'
         fill_in 'password', :with=>'123'
       end
       click_button 'Sign up'
       expect(page).to have_content "sorry that email is already registered"
     end
   end
end
