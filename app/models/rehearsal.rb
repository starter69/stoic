class Rehearsal < ActiveRecord::Base
has_many :e_answers
has_many :e_questions
accepts_nested_attributes_for :e_questions

end
