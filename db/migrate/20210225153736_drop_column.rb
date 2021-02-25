class DropColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :user_id
  end
end
