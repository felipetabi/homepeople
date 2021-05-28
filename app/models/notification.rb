class Notification < ApplicationRecord
    belongs_to :booking

    validates :state, presence: true
    validates :message, presence: true

    

end
