class Tag < ActiveRecord::Base
  has_many :exercise_taggings
  has_many :exercises, through: :exercise_taggings
  has_many :meditation_taggings
  has_many :meditations, through: :meditation_taggings
end
