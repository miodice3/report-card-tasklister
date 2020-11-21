class GoalDateCard < ActiveRecord::Base #passed
    belongs_to :goal  #removed pluralized s
    belongs_to :date_card

end