require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject {
    described_class.new(
      username: "test_user",
      email: "test@test.com",
      password: "test123",
      password_confirmation: "test123"
    )
  }

  it "is valid" do
    expect(subject).to be_valid
  end

  it "is not valid with not acceptable username" do
    subject.username = "TEST*USER"
    expect(subject).not_to be_valid
  end
end
