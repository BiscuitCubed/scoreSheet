class Competition < ActiveRecord::Base
  has_many :events
  has_many :competitors
end
