class AddUserToContact < ActiveRecord::Migration[5.0]
  def change
    add_reference :contacts, :user, foreign_key: true
  end
end
