class Solve < ActiveRecord::Base
  belongs_to :round
  belongs_to :competition_event
  belongs_to :average

  validates :solve_number, uniqueness: { scope: :competitor_id }
end
