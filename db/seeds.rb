User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

20.times do |n|
  name = "dinner-#{n+1}"
  host_id = rand(1..5)
  date = Time.now + n.days
  venue = Faker::Address.street_address
  num_guests = rand(4..10)
  cuisine = 'local'
  first_course = Faker::Hipster.sentence
  main_course = Faker::Team.creature
  dessert_course = Faker::Beer.style
  cost_per_pax = Faker::Commerce.price
  picture = Faker::Placeholdit.image("50x50", 'jpg')
  Event.create!(name:           name,
               host_id:         host_id,
               date:            date,
               venue:           venue,
               num_guests:      num_guests,
               cuisine:         cuisine,
               first_course:    first_course,
               main_course:     main_course,
               dessert_course:  dessert_course,
               cost_per_pax:    cost_per_pax,
               picture:         picture )

end
