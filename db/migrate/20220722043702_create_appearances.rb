class CreateAppearances < ActiveRecord::Migration[6.1]
  def change
    create_table :appearances do |t|
      t.references :user, null: false, foreign_key: true
      t.string :profile_title
      t.text :bio
      t.string :bg_color
      t.string :bg_image_url

      t.timestamps
    end
  end
end
