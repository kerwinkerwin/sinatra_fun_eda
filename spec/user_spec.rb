require 'spec_helper'

describe User do
  # before do
  #   @previous_user = User.create(name:)
  #   @user = User.create(name:"abdul",email:"jihad@net.com", password:"1234")
  # end
  context "before creation" do
    it "works" do
      user = instance_double("Users", :to_s=>'hello')
      # allow(user).to receive(:to_s){"receive me bby"}
      puts user.to_s
    end
  end
end
