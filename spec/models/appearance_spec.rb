require 'rails_helper'

RSpec.describe Appearance, type: :model do
  
  let(:tester) {
    User.create(username: "model_tester", email: "model_tester@email.com", password: "test123", password_confirmation: "test123")
  }

  subject {
    described_class.new(
      profile_title: "Lorem ipsum",
      bio: "Lorem ipsum",
      bg_color: nil,
      bg_image_url: nil,
      picture_url: nil,
      user_id: tester.id
    )
  }

  it "is valid" do
    expect(subject).to be_valid
  end

  it "is not valid with profile_title which has more than 30 characters" do
    subject.profile_title = "Lorem ipsum dolor sit amet, con"
    expect(subject).not_to be_valid
  end

  it "is not valid with bio which has more than 80 characters" do
    subject.profile_title = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula e"
    expect(subject).not_to be_valid
  end

  it "is attached" do
    subject.picture.attach(
      io: File.open(Rails.root.join('spec', 'factories', 'image', 'profile.jpeg')),
      filename: 'profile.jpeg',
      content_type: 'image/jpeg'
    )
    expect(subject.picture).to be_attached
  end
end
