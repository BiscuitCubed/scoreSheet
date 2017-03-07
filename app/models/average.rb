class Average < ActiveRecord::Base
  belongs_to :competitor
  belongs_to :round
  has_many :solves
end
