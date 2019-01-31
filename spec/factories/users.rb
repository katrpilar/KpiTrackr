FactoryBot.define do
    # factory :admin do
    #   email { Faker::Internet.email }
    #   password "password"
    #   password_confirmation "password"
    #   #confirmed_at Date.today
    # end
    # passwordy = Faker::Internet.password
    factory :user do
      email { Faker::Internet.email }
      password 'passwordy'
      password_confirmation 'passwordy' 
      username { Faker::Internet.username }
      #confirmed_at Date.today
    end
end
