FactoryBot.define do
    # factory :admin do
    #   email { Faker::Internet.email }
    #   password "password"
    #   password_confirmation "password"
    #   #confirmed_at Date.today
    # end
    factory :user do
      email { Faker::Internet.email }
      password "password"
      password_confirmation "password" 
      username "Rspec Test"
      #confirmed_at Date.today
    end
end
