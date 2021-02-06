class Chore < ApplicationRecord
    belongs_to :task
    belongs_to :child

    # scopes
    scope :by_task, -> { joins(:task).order("name") }
    scope :chronological, -> { order("due_on") }

    scope :pending, -> { where(completed: false) }
    scope :done, -> { where(completed: true) }
    scope :upcoming, -> { where('due_on >= ?', Date.today) }
    scope :past, -> { where('due_on < ?', Date.today) }
end
