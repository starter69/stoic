class EQuestion < ActiveRecord::Base
  belongs_to :exercise
  has_many :e_answers
  accepts_nested_attributes_for :e_answers, allow_destroy: true
end

