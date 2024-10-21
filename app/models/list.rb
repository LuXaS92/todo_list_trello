class List < ApplicationRecord
  belongs_to :board
  has_many :cards, dependent: :destroy

  validates :title, presence: true
  validates :position, presence: true, numericality: { only_integer: true }

  default_scope { order(position: :asc) }
end