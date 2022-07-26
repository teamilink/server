class AddPictureUrlToAppearance < ActiveRecord::Migration[6.1]
  def change
    add_column :appearances, :picture_url, :string
  end
end
