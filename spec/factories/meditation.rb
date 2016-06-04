FactoryGirl.define :meditation do
  title    'Meditation title'
  passage  'Meditation passage'
  category 'Meditation category'
end

FactoryGirl.define :tags do
  name 'Seneca'
  association :meditation, through: :meditation_taggings
end
