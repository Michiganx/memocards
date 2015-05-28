class Card < ActiveRecord::Base
  belongs_to :deck

  validates :sidea, :sideb,  presence: true

end
