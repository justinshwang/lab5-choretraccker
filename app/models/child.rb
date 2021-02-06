class Child < ApplicationRecord
    has_many :chores
    has_many :tasks, through: :chores
    
    validates_presence_of :first_name
    validates_presence_of :last_name 

    # methods
    
    # returns "First Last"
    def name 
        first_name + " " + last_name
    end
    # returns points earned from chores
    def points_earned
        self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
    end 

    # scopes
    scope :alphabetical, -> { order("last_name", "first_name") }
    scope :active, -> { where(active: true) }

end
