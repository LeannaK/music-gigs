class Venue < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :gigs, :dependent => :delete_all
end
