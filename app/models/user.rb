# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string           not null
#  last_name              :string           not null
#  birthday               :datetime
#  role                   :integer          default(0)
#  address                :string           not null
#  region                 :string           not null
#  comuna                 :string           not null
#  description            :string           not null
#  phone                  :string           not null
#  terms                  :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_one :service, dependent: :destroy
  has_one :working_setting, dependent: :destroy
  has_many :bookings, foreign_key: "client_id"
  has_many :notifications, as: :notificable
end
