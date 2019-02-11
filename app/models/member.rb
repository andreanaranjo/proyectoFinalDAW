class Member < ApplicationRecord
  has_one :position
  has_one_attached :profile_pic
  has_one :user
end
