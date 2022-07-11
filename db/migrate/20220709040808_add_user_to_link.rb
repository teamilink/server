class AddUserToLink < ActiveRecord::Migration[6.1]
  def change
    add_reference :links, :user, foreign_key: true, null: true, default: 1
  end
end
