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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
