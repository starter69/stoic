class Exercise < ActiveRecord::Base
  has_many :e_questions, :dependent => :destroy
  accepts_nested_attributes_for :e_questions
end
