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
  name = "Dinner-#{n+1}"
  host_id = rand(1..5)
  date = Time.now
  venue = Faker::Address.street_address
  num_guests = rand(4..10)
  cuisine = 'local'
  first_course = Faker::Hipster.sentence
  main_course = Faker::Team.creature
  dessert_course = Faker::Beer.style
  cost_per_pax = Faker::Commerce.price
  pictureBank = ["http://placekitten.com/50/50", "https://unsplash.it/50", "https://placebear.com/50/50", "http://stevensegallery.com/50/50", "http://placebeard.it/50/50", "http://fillmurray.com/50/50", "http://www.placecage.com/c/50/50", "http://www.placecage.com/50/50", "http://www.placecage.com/g/50/50"]
  picture = pictureBank[n%9]

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
               picture:         picture)

end


200.times do |n|
  event_id = n%20+1
  guest_id = n%95+1
  accepted = false
  Signup.create!(event_id:    event_id,
               guest_id:      guest_id,
               accepted:      accepted)

end
