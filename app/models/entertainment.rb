# == Schema Information
#
# Table name: entertainments
#
#  id         :integer          not null, primary key
#  picture    :string
#  title      :string
#  category   :string
#  rating     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entertainment < ApplicationRecord
    
    has_many :ratings, :dependent => :destroy

    has_many :recommends, :dependent => :destroy
    
    validates_numericality_of :rating, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10
    
    validates :title, :presence => true, :uniqueness => true
    
 
  def average_rating
    self.class.average(:rating).where(:title => self.title)
  end

    
    #def average_rating
        
        #@ratings.group(:title.average(:rating)
        
    #end
    
end
