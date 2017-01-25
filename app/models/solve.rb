class Solve < ActiveRecord::Base
  belongs_to :round
  belongs_to :competition_event

  validates :solve_number, uniqueness: { scope: :competitor_id }
end
