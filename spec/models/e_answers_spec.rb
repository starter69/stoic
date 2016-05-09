require 'rails_helper'
require 'spec_helpers/create_exercise_steps'

describe EAnswer do
  before :each do
    create_exercise
    create_e_question
    create_e_answer
  end

  it "returns an exercise answer as a string" do
    expect(@e_answer.answer). to eq 'Yes, I practice it every day.'
  end

  it "can be accessed via an e_question"
  it "can be accessed via a rehearsal, since it is a nested attribute of rehearsal via e_question"
end
