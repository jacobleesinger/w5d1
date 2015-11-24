FactoryGirl.define do
  factory :goal do
    title "Title"
    description "blah blah blah"
    user_id 1
    status "NEW"
    visibility "PRIVATE"

    factory :public_goal do
      visibility "PUBLIC"
    end

    factory :shitty_goal do
      title "Shitty Title"
    end
  end
end
