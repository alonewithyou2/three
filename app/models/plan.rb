class Plan < ActiveRecord::Base
    #says each plan has many users, such as the basic plan or the pro plan
    has_many :users
end