class CreateRecommends < ActiveRecord::Migration[5.0]
  def change
    create_table :recommends do |t|
      t.integer :entertainment_id
      t.integer :user_id
      t.string :username
      t.integer :receiver_id

      t.timestamps

    end
  end
end
