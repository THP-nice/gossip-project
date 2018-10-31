class User < ApplicationRecord
  has_many :gossips
  has_many :likes
  has_many :comments
end
