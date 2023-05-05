class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :purchases, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :icon, presence: true
end
