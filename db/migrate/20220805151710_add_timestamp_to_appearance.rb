class AddTimestampToAppearance < ActiveRecord::Migration[6.1]
  def change
    add_column :appearances, :img_timestamp, :string
    add_column :appearances, :pic_timestamp, :string
  end
end
