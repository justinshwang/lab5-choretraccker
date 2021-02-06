class Task < ApplicationRecord
    # relationships
    has_many :chores
    has_many :children, through: :chores
    
    # validations
    validates_presence_of :name 
    validates_numericality_of :points, :greater_than_or_equal_to => 0, :only_integer => true

    # scopes
    scope :alphabetical, -> { order("name") }
    scope :active, -> { where(active: true) }
end
