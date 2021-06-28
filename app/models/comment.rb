class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  has_one :service, through: :booking

  def self.average_comments
    average(:rating).round(2)
  end
  
end
