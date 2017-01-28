class CompetitionEvent < ActiveRecord::Base
  belongs_to :competition
  has_many   :solves
  has_many   :competitors
  has_many   :rounds
end
