FactoryGirl.define do
  factory :quotation do
    title    'Dankenliste'
    passage  'Von ruhmvollen Andenken meines Vaters erhielt ich den Antrieb zu einem bescheidenen und zugleich männlichen Wesen.'
    category 'Dankeliste'
  end

  factory :tag do
    name 'Love and Roses 2'
  end

  trait :with_tag do
    after(:create) do |quotation|
      #quotation.tags << create(:tag, name: "Germany")
      quotation.tags << create(:tag, name: "Franc")
    end
  end
end

#Something here isn't working due to the has_many through relationship and setting up of the Factory... there is a blog post at http://nepalonrails.com/blog/2014/09/factory-girl-traits-and-list-for-has-many-through-relation that shows an example of how it should work... otherwise just google "has many through FactoryGirl" and there are lots of solutions. I am tired now, I think I am just doing something small wrong here... It really should just work out of the box. I mean it is just a has_many through relationship and FactoryGirl through its advanced associations should just be able to test that normally.
#