class Competitor < ActiveRecord::Base
  belongs_to :competion
  belongs_to :event
  has_many :solves
end
