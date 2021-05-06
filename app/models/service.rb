class Service < ApplicationRecord

    validates :title, presence: true
    validates :description, presence: true
    validates :region, presence: true 

    has_many_attached :certificates
    belongs_to :user

    belongs_to :category
    has_many :schedules
    
end
