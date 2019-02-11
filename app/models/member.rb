class Member < ApplicationRecord
  has_one :position
  has_one_attached :avatar
end
