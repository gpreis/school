class Course < ActiveRecord::Base
  has_many :classrooms, dependent: :destroy
  has_many :students, through: :classrooms
 
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, numericality: { only_integer: true }, allow_blank: true

  def to_s
    name
  end
end
