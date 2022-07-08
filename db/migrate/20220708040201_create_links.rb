class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :title
      t.string :link_address

      t.timestamps
    end
  end
end
