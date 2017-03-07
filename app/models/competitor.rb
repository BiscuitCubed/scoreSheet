class Competitor < ActiveRecord::Base
  belongs_to :competion
  belongs_to :competitonEvent
  has_many :solves
  has_many :averages

  attr_accessor :e_3x3
end
