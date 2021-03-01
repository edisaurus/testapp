class Specialization < ApplicationRecord
    validates :branch, :description, presence: true
    validates :description, length: { minimum: 10, maximum: 120 }
    belongs_to :engineering
end
