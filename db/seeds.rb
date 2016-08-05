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
  pictureBank = ["http://culinaryinspo.com/wp-content/uploads/2014/09/Foodporn-e1431932972971-200x200.jpg",
   "http://6.darkroom.shortlist.com/200/ee1c104b08eed35b121732b6c9491b42:166e1894cab41dd42be227af4be8b134/capture.JPG",
   "http://whoismocca.com/wp-content/uploads/2015/03/whoismocca-blogger-foodblogger-foodporn-tirol-austria-healthy-veggie-vegetarisch-burger-avocado-aubergine-salat-rezept-01-200x200.jpg",
   "http://5.darkroom.shortlist.com/200/c4cc64b2a011c261f3eea801e30858b6:2ca0e6c2e647469d0be747ef1a7f083d/capture2.JPG",
   "http://www.scottsanfilippo.com/wp-content/uploads/2016/04/Screen-Shot-2016-04-08-at-12.31.21-PM-200x200.png",
   "http://rs192.pbsrc.com/albums/z226/guilucios/696e26d9-4906-4ed0-b3eb-e85bfbc09b90_zps8b695338.jpg~c200",
   "http://www.scottsanfilippo.com/wp-content/uploads/2016/01/Screen-Shot-2016-01-11-at-3.35.22-PM-200x200.png",
   "https://s-media-cache-ak0.pinimg.com/236x/e4/f7/63/e4f763053eac33b8d6219321fcf4f454.jpg",
   "http://universe.byu.edu/wp-content/uploads/2016/02/station-22-food1.png",
   "http://whalebonemag.com/wp-content/uploads/2015/08/DSC_4647-Edit-1050x701.jpg",
   "https://s-media-cache-ak0.pinimg.com/236x/18/e7/d5/18e7d50334457ee6f66ff6a86e94bb66.jpg",
   "https://media0.giphy.com/media/4Huv9Jp9ucruM/200_s.gif",
   "http://pbs.twimg.com/media/BkkV9RnIIAEXq8A.jpg",
   "http://5.darkroom.shortlist.com/200/c4cc64b2a011c261f3eea801e30858b6:2ca0e6c2e647469d0be747ef1a7f083d/capture2.JPG",
   "http://www.scottsanfilippo.com/wp-content/uploads/2016/04/Screen-Shot-2016-04-08-at-12.31.21-PM-200x200.png",
   "http://rs192.pbsrc.com/albums/z226/guilucios/696e26d9-4906-4ed0-b3eb-e85bfbc09b90_zps8b695338.jpg~c200",
   "http://www.scottsanfilippo.com/wp-content/uploads/2016/01/Screen-Shot-2016-01-11-at-3.35.22-PM-200x200.png",
   "https://s-media-cache-ak0.pinimg.com/236x/e4/f7/63/e4f763053eac33b8d6219321fcf4f454.jpg",
   "http://universe.byu.edu/wp-content/uploads/2016/02/station-22-food1.png",
   "http://whalebonemag.com/wp-content/uploads/2015/08/DSC_4647-Edit-1050x701.jpg",
   "http://tse2.mm.bing.net/th?id=OIP.M784dbacf5ee5173c1c8589223550eb46o0&w=200"]
  picture = pictureBank[n%21]

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

# food_picture_bank =
#  ["http://placekitten.com/50/50", "https://unsplash.it/50", "https://placebear.com/50/50", "http://stevensegallery.com/50/50", "http://placebeard.it/50/50", "http://fillmurray.com/50/50", "http://www.placecage.com/c/50/50", "http://www.placecage.com/50/50", "http://www.placecage.com/g/50/50"]
