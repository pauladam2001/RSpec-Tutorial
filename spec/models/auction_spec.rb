require 'rails_helper'

# rspec spec/models/auction_spec.rb - in console

# https://devhints.io/rspec - cheat sheet

RSpec.describe Auction, type: :model do
  let(:seller) {
    User.new(email: "jane@doe.com", password: "pw1234")
  }
  subject {
    described_class.new(title: "Anything",
                        description: "Lorem ipsum",             # we can only have one subject (instance of the main object we are testing) and multiple let
                        start_date: DateTime.now,
                        end_date: DateTime.now + 1.week,
                        user_id: 1
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a start_date" do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a end_date" do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do 
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:bids) }
  end

  xit "is valid with valid attributes" do     # xit instead of it means that the test is disabled
    expect(subject).to be_valid
  end
end
