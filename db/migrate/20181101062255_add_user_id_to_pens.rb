class AddUserIdToPens < ActiveRecord::Migration
  def change
    add_column :pens, :user_id, :integer
  end
end
