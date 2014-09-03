FactoryGirl.define do
  factory :list do
    name "Work list"
    description "Everything to do at work this week"

    after(:create) do |list|
      list.todos << create(:todo)
    end
  end
end