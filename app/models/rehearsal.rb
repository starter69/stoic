class Rehearsal < ActiveRecord::Base
has_many :e_answers, through: :e_questions
has_many :e_questions
accepts_nested_attributes_for :e_questions
accepts_nested_attributes_for :e_answers
belongs_to :exercises
end
