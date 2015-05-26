require 'spec_helper'

describe "sign-in" , :type => :feature do
 before do
   visit '/'
 end

 it "does stuff" do
   click_link('Pick Up')
   click_link('Pick Up')
  # within("#pickup-details")
    page.within(".column1") do
      fill_in 'Customer.Name', :with => "Mr Capybara"
      fill_in 'Customer.Phone', :with => '0276665555'
      fill_in 'Customer.Email', :with => "TEST@TEST.COM"
    end
    page.within(".column2") do
      fill_in "Customer.Suburb", :with => "Wellington"
    end
    click_button 'Select Store'
    click_button 'No'
    click_link('WELLINGTON CITY')
    click_link('asap')
    click_link('Hickory BBQ Pulled Beef')
    click_button('Add to Order')
    click_link('Next')
    click_link('Next')
    click_link('Next')
    click_link('Credit Card')
    page.within(".details-container") do
      fill_in 'FullNameOnCard', :with => "K C Omalley"
      fill_in 'Number', :with=> "NOT TODAY SORRY"
    end
   #
  #  within("#login_form") do
  #    fill_in 'email', :with => ""
  #    fill_in 'pass', :with => " "
  #  end
  #  click_button 'Log In'
  #  within('.innerWrap') do
  #    fill_in 'xhpc_message', :with => "Using capybara"
  #  end
  #  click_button 'Post'
 end
end
