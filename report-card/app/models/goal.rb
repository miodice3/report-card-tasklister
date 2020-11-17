class Goal < ActiveRecord::Base #passed
    belongs_to :user
    has_many :goal_date_cards
    has_many :date_cards, through: :goal_date_cards
end