class CreateMovieusers < ActiveRecord::Migration[5.1]
  def change
    create_table :movieusers do |t|
      t.string :name
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
