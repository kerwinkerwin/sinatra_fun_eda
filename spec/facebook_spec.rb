require 'spec_helper'

describe "sign-in" , :type => :feature do
 before do
   visit '/'
 end

 it "does stuff" do
   within("#login_form") do
     fill_in 'email', :with => ""
     fill_in 'pass', :with => " "
   end
   click_button 'Log In'
   within('.innerWrap') do
     fill_in 'xhpc_message', :with => "Using capybara"
   end
   click_button 'Post'
 end
 end
