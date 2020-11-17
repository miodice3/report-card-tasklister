class User < ActiveRecord::Base #passed
    has_secure_password #passed
    has_many :date_cards #passed
    has_many :goal_date_cards, through: :date_cards #missed colin
    has_many :goals #passed
end