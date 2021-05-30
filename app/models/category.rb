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
    has_many :service
    has_many :notifications, as: :notificable, dependent: :destroy

    validates :name, presence: true
end
