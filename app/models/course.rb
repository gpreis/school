class Course < ActiveRecord::Base
  has_many :classrooms, dependent: :destroy
 
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, numericality: { only_integer: true }, allow_blank: true
end
