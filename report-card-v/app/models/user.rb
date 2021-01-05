class User < ActiveRecord::Base
    #has_many :dates
    has_secure_password
end