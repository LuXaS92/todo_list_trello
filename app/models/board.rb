class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :cards, through: :lists

  validates :title, presence: true
end