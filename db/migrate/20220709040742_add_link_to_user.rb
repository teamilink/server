class AddLinkToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :link, foreign_key: true
  end
end
