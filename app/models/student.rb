class Student < ActiveRecord::Base
  has_many :classrooms, dependent: :destroy

  validates :name, presence: true
  validates :register_number, presence: true, uniqueness: true
  validates :status, numericality: { only_integer: true }, allow_blank: true
end
