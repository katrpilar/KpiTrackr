FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    # user_id { FactoryBot(:user).id } 
    avatar { Faker::Company.logo }
  end
end
