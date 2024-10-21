class Card < ApplicationRecord
  belongs_to :list

  validates :title, presence: true
  validates :position, presence: true, numericality: { only_integer: true }

  default_scope { order(position: :asc) }
end