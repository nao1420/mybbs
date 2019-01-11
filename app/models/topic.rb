class Topic < ApplicationRecord
  has_many :topics , dependent: :destroy
  belongs_to :user
end
