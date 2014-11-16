class Doctrine < ActiveRecord::Base
  has_many :doctrine_taggings
  has_many :tags, through: :doctrine_taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).doctrines
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
