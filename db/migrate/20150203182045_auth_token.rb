class AuthToken < ActiveRecord::Migration
  def change
    add_column :users, :authentication_tokens, :string
  end
end
