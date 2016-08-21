FactoryGirl.define do
  factory :meditation do
    title    'Dankenliste'
    passage  'Von ruhmvollen Andenken meines Vaters erhielt ich den Antrieb zu einem bescheidenen und zugleich männlichen Wesen.'
    category 'Dankeliste'
  end

  factory :tag do
    association :meditation
  end

  after(:create) do |meditation|
      meditation.tags << FactoryGirl.create(:tag, name: "Seneca", name: "Epictetus")
  end
end
