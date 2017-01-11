class Round < ActiveRecord::Base
  belongs_to :events
  attr_accessor :event_id

  validates :round_number, uniqueness: { scope: :event_id }
end
