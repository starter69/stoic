class EQuestion < ActiveRecord::Base
  belongs_to :exercises
  has_many :e_answers, :dependent => :destroy
  accepts_nested_attributes_for :e_answers
end
