require 'rails_helper'

RSpec.describe Link, type: :model do
  
  let(:tester) {
    User.create(username: "model_tester", email: "model_tester@email.com", password: "test123", password_confirmation: "test123")
  }

  subject {
    described_class.new(
      title: "New Link",
      link_address: "https://google.com",
      user_id: tester.id
    )
  }

  it "is valid" do
    expect(subject).to be_valid
  end

  it "is not valid with title which has over 100 characters" do
    subject.title = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean ma"
    expect(subject).not_to be_valid
  end

  it "is not valid with not acceptable link_address" do
    subject.link_address = "http:google.com"
    expect(subject).not_to be_valid
  end

  it "is not valid without user_id" do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end
  
  it "is not valid without title" do
    subject.title = nil
    expect(subject).not_to be_valid
  end
  
  it "is not valid without link_address" do
    subject.link_address = nil
    expect(subject).not_to be_valid
  end
end
