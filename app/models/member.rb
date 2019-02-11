class Member < ApplicationRecord
  has_one :position
  has_one :user
  has_one_attached :avatar
end
