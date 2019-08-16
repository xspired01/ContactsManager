require 'rails_helper'

RSpec.describe User, type: :model do

    subject(:user) {User.new(username: "Armitage")}
  
    describe "validations" do
        it "should validate presence of username" do
            user = User.new(username: 'Goose')
            expect(user.valid?).to be false
        end 
        # it { should validate_presence_of(:username) }

        # it "should validate password length greater than 6" do
        #     user2 = User.new(username: "john doe", password: "password")
        #     user2.valid?
        #     expect(user2.errors[:password]).to eq(["length must be greater than 6 characters"])
        # end 
        
        # it "should validate presence of password_digest"
        # it "should validate presence of session_token"
        # it "should validate uniqueness of session_token"

    end

    describe "associations" do
        # it "should have many contacts"
        it {should have_many(:contacts)}
    end

    # describe "class methods" do
    
    # end

end