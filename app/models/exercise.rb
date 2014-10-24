class Exercise < ActiveRecord::Base
  belongs_to :user
  has_many :e_answers, through: :e_questions
  has_many :e_questions, :dependent => :destroy
  has_many :rehearsals
  accepts_nested_attributes_for :rehearsals
  accepts_nested_attributes_for :e_questions, :reject_if => lambda { |a| a[:question].blank? }, allow_destroy: true
  validates :title, presence: true
  validates :general_description, presence: true
end
