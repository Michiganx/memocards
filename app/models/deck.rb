class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :destroy
  accepts_nested_attributes_for :cards,  :reject_if => :all_blank, :allow_destroy => true

  validates :user_id, presence: true
  validates :name,  presence: true, length: { maximum: 120 }

end
