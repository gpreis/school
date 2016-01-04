class Student < ActiveRecord::Base
  has_many :classrooms

  validates :name, presence: true
  validates :register_number, presence: true, unique: true
  validates :status, numericality: { only_integer: true }
end
