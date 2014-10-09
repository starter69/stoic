class Rehearsal < ActiveRecord::Base
belongs_to :exercise
has_many :e_questions, through: :exercises
has_many :e_answers, :dependent => :destroy
accepts_nested_attributes_for :e_answers
accepts_nested_attributes_for :e_questions
end