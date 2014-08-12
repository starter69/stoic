class Rehearsal < ActiveRecord::Base
has_many_and_belongs_to :exercise
has_many :e_answers, through: :e_questions
has_many :e_questions, through: :exercises
accepts_nested_attributes_for :e_questions
accepts_nested_attributes_for :e_answers
end
