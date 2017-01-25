class Competition < ActiveRecord::Base
  has_many :competition_events
  has_many :competitors
end
