class Round < ActiveRecord::Base
  belongs_to :events
  attr_accessor :event_id
end
