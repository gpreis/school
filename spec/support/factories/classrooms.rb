FactoryGirl.define do
  factory :classroom, class: Classroom do
    association :course, factory: :course
    association :student, factory: :student
  end
end
