# == Schema Information
#
# Table name: recommends
#
#  id               :integer          not null, primary key
#  entertainment_id :integer
#  user_id          :integer
#  username         :string
#  receiver_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Recommend < ApplicationRecord
    
    belongs_to :user

    belongs_to :entertainment
    
end
