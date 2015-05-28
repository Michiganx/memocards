class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :destroy
  accepts_nested_attributes_for :cards,  :reject_if => :all_blank, :allow_destroy => true

  validates :user_id, presence: true
  validates :name,  presence: true, length: { maximum: 120 }

  def deep_clone
    new_deck = self.dup
    self.cards.each do |c|
      new_deck.cards << c.dup
    end
    new_deck
  end

end
