class AddExpiresatToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :expiresat, :date
  end
end
