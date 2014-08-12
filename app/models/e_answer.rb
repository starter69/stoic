class EAnswer < ActiveRecord::Base
  belongs_to :e_question
  belongs_to :rehearsal
  belongs_to :exercise
  # scope :visible_to, -> (user) { where(user_id: user.id)}
end
