class Round < ActiveRecord::Base
  belongs_to :competition_event
  has_many :averages
  has_many :solves

  validates :round_number, uniqueness: { scope: :competition_event }
end
