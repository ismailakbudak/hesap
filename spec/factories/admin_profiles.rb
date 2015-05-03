FactoryGirl.define do
  factory :admin_profile do
    first_name 'First Name'
    last_name 'Last Name'
    gsm '05065051020'
  end

  factory :invalid_admin_profile, parent: :admin_profile do |f|
    f.first_name nil
  end

end
