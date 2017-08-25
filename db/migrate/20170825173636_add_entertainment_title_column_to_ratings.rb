class AddEntertainmentTitleColumnToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :entertainment_title, :string
  end
end
