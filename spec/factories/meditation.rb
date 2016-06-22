FactoryGirl.define do
  factory :meditation do
    title    'Was Ich von Meiner Familie Gelernt Habe'
    passage  'Von ruhmvollen Andenken meines Vaters erhielt ich den Antrieb zu einem bescheidenen und zugleich männlichen Wesen.'
    category 'Dankeliste'
  end
end

FactoryGirl.define do
  factory :tags do
  name 'Seneca'
  name 'Epictetus'
  association :meditation, through: :meditation_taggings
  end
end
