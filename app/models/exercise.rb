class Exercise < ActiveRecord::Base
  has_many :e_questions
  accepts_nested_attributes_for :e_questions, :reject_if => lambda { |a| a[:question].blank? }, allow_destroy: true
end
