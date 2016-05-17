require 'rails_helper'
require 'spec_helpers/create_exercise_steps'
require 'spec_helpers/user_steps'

describe EAnswer do
  before :each do
    create_exercise
    create_e_question
    create_e_answer
  end

  it "returns an exercise answer as a string" do
    expect(@e_answer.answer). to eq 'Yes, I practice it every day.'
  end

  it "can be accessed via an e_question" do
    expect(@e_question.e_answers).to exist
  end

  it "can be accessed via a rehearsal, since it is a nested attribute of rehearsal via e_question" do
    create_rehearsal
    expect(@rehearsal.e_answers).to exist
  end

  it "can be read by the user to whom this rehearsal belongs" do
    create_normal_user
    expect(@normal_user.rehearsal).to exist
  end

  it "can be edited by the user to whom this rehearsal belongs"

  it "cannot be read by a user to whom this rehearsal does not belong"

  it "cannot be edited by a user to whom this rehearsal does not belong"
end
