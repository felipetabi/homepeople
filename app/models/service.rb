class Service < ApplicationRecord

    has_many :schedules
    has_many_attached :certificates
    belongs_to :user
    belongs_to :category
    

    
    validates :title, presence: true
    validates :description, presence: true
    validates :region, presence: true 

    validate :correct_document_mime_type

    def correct_document_mime_type
        self.certificates.each do |certificate|
            if !certificate.content_type.in?(%w(application/pdf application/doc application/docx))
                
                errors.add(:certificates, 'Deben ser PDF o Word')
            end
        end
    end

end
