class EAnswer < ActiveRecord::Base
  belongs_to :e_question
  belongs_to :rehearsal
  # scope :visible_to, -> (user) { where(user_id: user.id)}
end
