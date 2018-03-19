class AddRefreshtokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :refreshtoken, :string
  end
end
