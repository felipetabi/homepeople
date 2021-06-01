class Service < ApplicationRecord

    has_many :schedules, dependent: :destroy
    has_many_attached :certificates, dependent: :destroy
    has_many :notifications, as: :notificable, dependent: :destroy
    belongs_to :user
    has_and_belongs_to_many :categories



    validates :title, presence: true
    validates :description, presence: true
    validates :region, presence: true

    validate :correct_document_mime_type

    after_save :change_user_role

    def correct_document_mime_type
        self.certificates.each do |certificate|
            if !certificate.content_type.in?(%w(application/pdf application/doc application/docx))
                errors.add(:certificates, 'Deben ser PDF o Word')
            end
        end
    end

    def change_user_role
        if self.user.role == 0
            self.user.update(role: 1)
        end
    end

end
