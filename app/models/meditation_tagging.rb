class MeditationTagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :meditation
end
