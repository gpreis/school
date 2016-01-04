class Course < ActiveRecord::Base
  has_many :classrooms
 
  validates :name, presence: true, unique: true
  validates :description, presence: true
  validates :status, numericality: { only_integer: true }
end
