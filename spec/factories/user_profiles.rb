FactoryGirl.define do
  factory :user_profile do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    gsm '05065051020'
  end

  factory :invalid_user_profile, parent: :user_profile do |f|
    f.first_name nil
  end
end
