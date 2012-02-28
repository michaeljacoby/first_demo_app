class AddTimestampToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reset_password_code, :string

    add_column :users, :reset_password_code_until, :datetime

  end
end
