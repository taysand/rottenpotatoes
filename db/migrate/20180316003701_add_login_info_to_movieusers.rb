class AddLoginInfoToMovieusers < ActiveRecord::Migration[5.1]
  def change
    add_column :movieusers, :oauth_token, :string
    add_column :movieusers, :oauth_expires_at, :datetime
  end
end
