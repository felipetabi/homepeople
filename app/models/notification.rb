class Notification < ApplicationRecord
    belongs_to :booking
    belongs_to :notificable, polymorphic: true

    validates :state, presence: true
    validates :message, presence: true

    

end
