class Competitor < ActiveRecord::Base
  belongs_to :competion
  belongs_to :competitonEvent
  has_many :solves
end
