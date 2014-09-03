FactoryGirl.define do
  factory :todo do
    description 'Meet with team'
    complete false
    list_id 1
    created_at Time.now
  end
end