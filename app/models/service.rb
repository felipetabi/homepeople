class Service < ApplicationRecord

    has_many_attached :certificates
    belongs_to :user

    belongs_to :category
    has_many :schedules
    
end
