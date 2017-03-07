class CompetitionEvent < ActiveRecord::Base
  belongs_to :competition
  has_many   :solves
  has_many   :competitors
  has_many   :rounds

  attr_accessor :e_3x3
  attr_accessor :e_2x2
  attr_accessor :e_skewb
end
