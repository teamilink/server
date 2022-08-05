class AppearanceSerializer
  include JSONAPI::Serializer
  attributes :id, :profile_title, :bio, :bg_color, :bg_image_url, :uploaded_picture_url, :picture_url
end
