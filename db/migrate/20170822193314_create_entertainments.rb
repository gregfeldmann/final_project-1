class CreateEntertainments < ActiveRecord::Migration[5.0]
  def change
    create_table :entertainments do |t|
      t.string :picture
      t.string :title
      t.string :category
      t.string :rating

      t.timestamps

    end
  end
end
