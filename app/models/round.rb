class Round < ActiveRecord::Base
  belongs_to :competiton_event
  attr_accessor :competition_event_id

  validates :round_number, uniqueness: { scope: :competition_event }
end
