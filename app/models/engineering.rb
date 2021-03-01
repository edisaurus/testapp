class Engineering < ApplicationRecord
    validates :subject, :description, :units, presence: true
    validates :description, length: { minimum: 10, maximum: 120 }
    validates :units, numericality: { only_integer: true }
    has_many :specializations
end
