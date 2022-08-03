FactoryBot.define do
  factory :appearance do
    user { nil }
    profile_title { "MyString" }
    bio { "MyText" }
    bg_color { "MyString" }
    bg_image_url { "MyString" }
    picture_url { "MyString" }
    picture { nil }
  end
end
