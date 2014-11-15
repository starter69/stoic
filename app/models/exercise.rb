class Exercise < ActiveRecord::Base
  belongs_to :user
  has_many :e_answers, through: :e_questions
  has_many :e_questions, :dependent => :destroy
  has_many :rehearsals
  has_many :exercise_taggings
  has_many :tags, through: :exercise_taggings
  accepts_nested_attributes_for :rehearsals
  accepts_nested_attributes_for :e_questions, :reject_if => lambda { |a| a[:question].blank? }, allow_destroy: true
  validates :title, presence: true
  validates :general_description, presence: true

  def self.tagged_with(name)
    Tag.find_by_name!(name).exercises
  end

  def tag_list
  tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
