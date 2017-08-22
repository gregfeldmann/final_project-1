# == Schema Information
#
# Table name: ratings
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  entertainment_id :integer
#  rating           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Rating < ApplicationRecord
    
    belongs_to :user

    belongs_to :entertainment

    validates_numericality_of :rating, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10
    
end
