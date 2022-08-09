class Author < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :capacity, numericality:
        { only_integer: true, greater_than: 0 }

    has_many :books
end
