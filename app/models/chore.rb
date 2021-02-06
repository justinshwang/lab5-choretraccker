class Chore < ApplicationRecord
    belongs_to :task
    belongs_to :child

    # validations
    validates_date :due_on

    # scopes
    scope :by_task, -> { joins(:task).order("name") }
    scope :chronological, -> { order("due_on") }

    scope :pending, -> { where(completed: false) }
    scope :done, -> { where(completed: true) }
    scope :upcoming, -> { where('due_on >= ?', Date.today) }
    scope :past, -> { where('due_on < ?', Date.today) }

    # methods
    def status 
        if self.completed == true 
            return "Completed"
        end
        return "Pending"
    end
end
