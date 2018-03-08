class Band < ApplicationRecord
  validates :name, presence: true
  validates :genre, presence: true
  belongs_to :user
end
