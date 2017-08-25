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
    
    validates :user_id, :uniqueness => {:scope => [:receiver_id, :entertainment_id], :message => "can only recommend an entertainment to another user once" }
end
