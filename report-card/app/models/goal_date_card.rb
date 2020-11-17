class GoalDateCard < ActiveRecord::Base #passed
    belongs_to :goals
    belongs_to :date_card
end