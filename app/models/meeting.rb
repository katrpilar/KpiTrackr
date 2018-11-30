class Meeting < ApplicationRecord
    belongs_to :company
    has_many :comments
end