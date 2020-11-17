class DateCard < ActiveRecord::Base
    belongs_to :user
    has_many :goal_date_cards
    has_many :goals, through: :goal_date_cards
end
