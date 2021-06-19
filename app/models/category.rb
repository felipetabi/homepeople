# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
    has_and_belongs_to_many :services
    has_many :notifications, as: :notificable, dependent: :destroy

    validates :name, presence: true
end
