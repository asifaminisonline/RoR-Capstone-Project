class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
