class Notification < ApplicationRecord
    belongs_to :notificable, polymorphic: true
    validates :message, presence: true

end
