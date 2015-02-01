FactoryGirl.define do
  
  factory :user do
    email        'user@example.com'
    password     'passwordy'
    confirmed_at Time.now - 1.day
  end
  
end
