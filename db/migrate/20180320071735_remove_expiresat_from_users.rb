class RemoveExpiresatFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :expiresat, :date
  end
end
