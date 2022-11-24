# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

puts "Cleaning reviews database..."
Review.destroy_all
puts "Cleaning bookings database..."
Booking.destroy_all
puts "Cleaning athletes database..."
Athlete.destroy_all
puts "Cleaning users database..."
User.destroy_all

puts "Creating users..."

u1 = User.create!(
  id: 1,
  email: "kevin@gmail.com",
  first_name: "Kevin",
  last_name: "Blakimé",
  phone_number: "0674263819",
  password: "123456",
)
  fileu1 = URI.open("https://avatars.githubusercontent.com/u/115102708?v=4")
  u1.photo.attach(io: fileu1, filename: "u1.jpg", content_type: "image/jpg")

u2 = User.create!(
  id: 2,
  email: "robin@gmail.com",
  first_name: "Robin",
  last_name: "Rettien",
  phone_number: "0774263819",
  password: "123456",
)
  fileu2 = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665072255/zfsfmzn9icpxkxusegly.jpg")
  u2.photo.attach(io: fileu2, filename: "u2.jpg", content_type: "image/jpg")

u3 = User.create!(
  id: 3,
  email: "gabriel@gmail.com",
  first_name: "Gabriel",
  last_name: "De Monts",
  phone_number: "0674263919",
  password: "123456",
)
  fileu3 = URI.open("https://avatars.githubusercontent.com/u/113995804?v=4")
  u3.photo.attach(io: fileu3, filename: "u3.png", content_type: "image/png")

u4 = User.create!(
    id: 4,
    email: "shayneze@gmail.com",
    first_name: "Shayneze",
    last_name: "Menegady",
    phone_number: "0679263919",
    password: "123456",
  )
    fileu4 = URI.open("https://avatars.githubusercontent.com/u/62299446?v=4")
    u4.photo.attach(io: fileu4, filename: "u4.png", content_type: "image/png")

u5 = User.create!(
    id: 5,
    email: "mehdi@gmail.com",
    first_name: "Mehdi",
    last_name: "Rachid",
    phone_number: "0679263934",
    password: "123456",
  )
    fileu5 = URI.open("https://avatars.githubusercontent.com/u/115085959?v=4")
    u5.photo.attach(io: fileu5, filename: "u5.png", content_type: "image/png")


puts "Creating athletes..."

a1 = Athlete.create!(first_name: "Karim",
  last_name: "Benzema",
  price_per_day: 1000,
  age: 35,
  location: "Algeria",
  summary: "Recent ballon d'or",
  features: "DZ",
  sport: "Football",
  user_id: 1,
  gender: "male")
  file1 = URI.open("https://www.topmercato.com/wp-content/uploads/2022/10/Karim-Benzema-Real-Madrid.jpg")
  a1.photo.attach(io: file1, filename: "a1.jpg", content_type: "image/jpg")

a2 = Athlete.create!(first_name: "Lebron",
  last_name: "James",
  price_per_day: 1850,
  age: 37,
  location: "States",
  summary: "100% american",
  features: "F*cking tall",
  sport: "Basketball",
  user_id: 1,
  gender: "male")
  file2 = URI.open("https://le10static.com/img/cache/article/576x324/0000/0021/216532.webp")
a2.photo.attach(io: file2, filename: "a2.jpg", content_type: "image/jpg")


a3 = Athlete.create!(first_name: "Kylian",
  last_name: "Mbappé",
  price_per_day: 1200,
  age: 23,
  location: "Paris",
  summary: "Amazing player",
  features: "Rapidity",
  sport: "Football",
  user_id: 1,
  gender: "male")
  file3 = URI.open("https://assets-fr.imgfoot.com/media/cache/1200x900/mbappe-maillot.jpg")
a3.photo.attach(io: file3, filename: "a3.jpg", content_type: "image/jpg")

a4 = Athlete.create!(first_name: "Kevin",
  last_name: "De Bruyne",
  price_per_day: 800,
  age: 31,
  location: "Manchester",
  summary: "Clever passer",
  features: "Accuracy",
  sport: "Football",
  user_id: 1,
  gender: "male")
  file4 = URI.open("https://images.midilibre.fr/api/v1/images/view/60ae4e30d286c23b8619a368/large/image.jpg?v=2")
  a4.photo.attach(io: file4, filename: "a4.jpg", content_type: "image/jpg")

a5 = Athlete.create!(first_name: "Stephen",
  last_name: "Curry",
  price_per_day: 1800,
  age: 34,
  location: "San Francisco",
  summary: "Fantastic baller",
  features: "Everything",
  sport: "Basketball",
  user_id: 1,
  gender: "male")
  file5 = URI.open("https://media.gqmagazine.fr/photos/6322ecfa4461180850bb4e73/16:9/w_2560%2Cc_limit/GettyImages-1403370742.jpg")
  a5.photo.attach(io: file5, filename: "a5.jpg", content_type: "image/jpg")

a6 = Athlete.create!(first_name: "Wendie",
  last_name: "Renard",
  price_per_day: 700,
  age: 32,
  location: "Lyon",
  summary: "Very good defender",
  features: "Tall",
  sport: "Football",
  user_id: 1,
  gender: "female")
  file6 = URI.open("https://imgresizer.eurosport.com/unsafe/1200x0/filters:format(jpeg):focal(1446x731:1448x729)/origin-imgresizer.eurosport.com/2021/09/17/3222001-65957288-2560-1440.jpg")
  a6.photo.attach(io: file6, filename: "a6.jpg", content_type: "image/jpg")

a7 = Athlete.create!(first_name: "Caroline",
  last_name: "Garcia",
  price_per_day: 600,
  age: 29,
  location: "Paris",
  summary: "Correct tennis player",
  features: "Agile",
  sport: "Tennis",
  user_id: 2,
  gender: "female")
  file7 = URI.open("https://imgresizer.eurosport.com/unsafe/1200x0/filters:format(jpeg):focal(1644x320:1646x318)/origin-imgresizer.eurosport.com/2022/11/06/3485114-71049448-2560-1440.jpg")
  a7.photo.attach(io: file7, filename: "a7.jpg", content_type: "image/jpg")

a8 = Athlete.create!(first_name: "Serena",
  last_name: "Williams",
  price_per_day: 1600,
  age: 41,
  location: "New York",
  summary: "Legend tennis player",
  features: "Powerful",
  sport: "Tennis",
  user_id: 2,
  gender: "female")
  file8 = URI.open("https://cdn-s-www.ledauphine.com/images/2DBFCB2B-8340-4FB7-AE07-128316D85274/MF_contenu/serena-williams-evoque-une-possible-retraite-en-fin-d-annee-1660057934.jpg")
  a8.photo.attach(io: file8, filename: "a8.jpg", content_type: "image/jpg")

a9 = Athlete.create!(first_name: "Novak",
  last_name: "Djokovic",
  price_per_day: 1900,
  age: 35,
  location: "Belgrade",
  summary: "Legend tennis player",
  features: "Clever",
  sport: "Tennis",
  user_id: 2,
  gender: "male")
  file9 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Novak_Djokovic_Queen%27s_Club_2018.jpg/1200px-Novak_Djokovic_Queen%27s_Club_2018.jpg")
  a9.photo.attach(io: file9, filename: "a9.jpg", content_type: "image/jpg")

a10 = Athlete.create!(first_name: "Max",
  last_name: "Verstappen",
  price_per_day: 1500,
  age: 25,
  location: "Amsterdam",
  summary: "F*cking fast",
  features: "Faster",
  sport: "Racing",
  user_id: 3,
  gender: "male")
  file10 = URI.open("https://cdn-1.motorsport.com/images/amp/6l9BgGj0/s1000/pole-man-max-verstappen-red-bu.jpg")
  a10.photo.attach(io: file10, filename: "a10.jpg", content_type: "image/jpg")

a11 = Athlete.create!(first_name: "Penelope",
  last_name: "Leprévost",
  price_per_day: 600,
  age: 42,
  location: "Paris",
  summary: "Good cavalier",
  features: "Jump",
  sport: "Equitation",
  user_id: 3,
  gender: "male")
  file11 = URI.open("https://france3-regions.francetvinfo.fr/image/wowBF0agY1QT42uWG35vHDpkfCI/1200x900/regions/2020/06/08/5ede8fee6cc58_penelope_leprevost_prix_hermes_paris_mars_2014.jpg")
  a11.photo.attach(io: file11, filename: "a11.jpg", content_type: "image/jpg")

a12 = Athlete.create!(first_name: "Khabib",
  last_name: "Nurmagomedov",
  price_per_day: 1500,
  age: 34,
  location: "Moscow",
  summary: "Hard puncher",
  features: "Punch",
  sport: "Boxing",
  user_id: 5,
  gender: "male")
  file12 = URI.open("https://www.parlons-basket.com/wp-content/uploads/2022/09/UFC-Khabib-Nurmagomedov-maigre.jpg")
  a12.photo.attach(io: file12, filename: "a12.jpg", content_type: "image/jpg")

puts "Creating bookings..."

b1 = Booking.create!(
  start_date: 'Thu, 24 Nov 2022',
  end_date: 'Tue, 29 Nov 2022',
  status: "accepted",
  price: 6000,
  duration: 5,
  user_id: u4.id,
  athlete_id: a1.id,
)

b2 = Booking.create!(
  start_date: 'Sat, 24 Dec 2022',
  end_date: 'Thu, 29 Dec 2022',
  status: "accepted",
  price: 6000,
  duration: 5,
  user_id: u2.id,
  athlete_id: a1.id,
)

b3 = Booking.create!(
  start_date: 'Thu, 5 Jan 2023',
  end_date: 'Sun, 8 Jan 2023',
  status: "pending",
  price: 4500,
  duration: 3,
  user_id: u5.id,
  athlete_id: a10.id,
)

b4 = Booking.create!(
  start_date: 'Sun, 26 Feb 2023',
  end_date: 'Tue, 28 Feb 2023',
  status: "pending",
  price: 4500,
  duration: 3,
  user_id: u3.id,
  athlete_id: a3.id,
)

b5 = Booking.create!(
  start_date: 'Sun, 12 Feb 2023',
  end_date: 'Thu, 16 Feb 2023',
  status: "accepted",
  price: 4500,
  duration: 4,
  user_id: u1.id,
  athlete_id: a12.id,
)
puts "Creating reviews..."

Review.create!(
  content: "Fantastic match in my garden ! Sorry for your ankle though, I hope you will recover ! And...hem... yes, would you mind if I keep your rolex? Thanks super DZ",
  rating: 5,
  booking_id: b1.id,
)

Review.create!(
  content: "Was great! Fantastic right foot! Don't worry about my windows, I'll replace them",
  rating: 4,
  booking_id: b2.id,
)

Review.create!(
  content: "Do you even know what a red light is?",
  rating: 2,
  booking_id: b3.id,
)

Review.create!(
  content: "Please, stop running...",
  rating: 4,
  booking_id: b4.id,
)

Review.create!(
  content: "Lost my sight, my jaw and the ability to walk. A little bit too nervous. Wouldn't recommend unless you are Eric Zemmour",
  rating: 3,
  booking_id: b5.id,
)

puts "Finished!"
