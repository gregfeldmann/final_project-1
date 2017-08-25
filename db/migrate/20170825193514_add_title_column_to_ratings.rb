class AddTitleColumnToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :title, :string
  end
end
