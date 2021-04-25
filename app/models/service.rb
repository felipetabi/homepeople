class Service < ApplicationRecord

    has_many_attached :certificates
    belongs_to :user

    has_one :category
end
