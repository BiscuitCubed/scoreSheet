class Event < ActiveRecord::Base
  belongs_to :competitions
  has_many   :solves
  has_many   :competitors
  has_many   :rounds
end
