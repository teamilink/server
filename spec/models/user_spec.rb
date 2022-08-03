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

  it "is not valid with not acceptable email" do
    subject.email = "wrong_format.com"
    expect(subject).not_to be_valid
  end

  it "is not valid if username is empty" do
    subject.username = nil
    expect(subject).not_to be_valid
  end

  it "is not valid if email is empty" do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it "is not valid if password is empty" do
    subject.password = nil
    expect(subject).not_to be_valid
  end

  it "is not valid if password and its confirmation are different" do
    subject.password_confirmation = "123123"
    expect(subject).not_to be_valid
  end
end
