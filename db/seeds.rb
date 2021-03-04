require 'faker'

puts "Clean database"

# USER ############################
User.destroy_all
puts "Destroy Users"
Developer.destroy_all
puts "--Destroy Developers"

10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
  )
  user.save!
  puts user.name
  puts user.email
  puts user.password

  # DEVELOPER ########################
  4.times do
    new_name = Faker::Name.name
    puts new_name
    specialty = %w[PHP JS Ruby Web-Design C++ Pascal C# CSS HTML SASS jQuery Java C Python].sample(2)
    specialty = "#{specialty[0]}, #{specialty[1]}"
    developer = Developer.new(
      owner: User.last,
      name: new_name,
      specialty: specialty,
      age: rand(18..65),
      bio: ["Hi, I'm #{new_name}! I am a full-stack Web Application Developer and #{specialty} Developer, 
        currently living in Philadelphia, PA. I have a Bachelor of Science in Computer 
        Science from Northeastern University, and my primary focus and inspiration for my 
        studies is Web Development. In my free time, I study human computer interface and 
        the psychology of human computer interaction.",
        "My name is #{new_name} and I am a full-stack #{specialty} Developer and 
        Software Developer, currently living in Philadelphia, PA. I have a Bachelor of 
        Science in Computer Science from Northeastern University, and my primary focus 
        and inspiration for my studies is Web Development. In my free time, I study human 
        computer interface and the psychology of human computer interaction.",
        "#{new_name} is a #{specialty} professional at HubSpot.INC, an inbound marketing 
        and sales platform that helps companies attract visitors, convert leads, and close 
        customers. Previously, Rodney worked as a marketing manager for a tech software startup. 
        He graduated with honors from Columbia University with a dual degree in Business 
        Administration and Creative Writing"
      ].sample,
      daily_rate: rand(20..200)
    )
    developer.save!
    
    # BOOKING ##########################
    Booking.destroy_all
    1.times do
      booking = Booking.new(
        project_name: 
          [
            "Add a new feature to your #{developer.specialty} application",
            "Convert xd to html, sketch to html, psd to html responsive bootstrap 4",
            "Code #{developer.specialty} script, projects, automation tasks, web scraping",
            "Sql database design, er diagram queries, #{developer.specialty} python projects",
            "Be your airtable expert and consultant",
            "Convert website#{developer.specialty} to android app and ios app",
            "Fix any bug in your #{developer.specialty} app",
            "Develop android and IOS#{developer.specialty} app using #{developer.specialty}",
            "Be #{developer.specialty} app developer for android app and ios app",
            "write a #{developer.specialty} python 3 script",
            "Complete #{developer.specialty} projects professionally",
            "Give you aquos, my best forex expert advisor with PDF and VIP telegram group",
            "Do programming in c #{developer.specialty}"
          ].sample,
        start_date: Date.today-rand(10000), 
        end_date: Date.today+rand(10000), 
        total_price: rand(500..5000), 
        status: %w[accepted pending].sample,
        developer: Developer.all.sample,
        renter: User.all.sample
      )
      booking.save!
      puts "Bookings ok!"
    end
  end
end

4.times do
  booking = Booking.new(
    project_name: Faker::Game.title, 
    start_date: Date.today-rand(10000), 
    end_date: Date.today+rand(10000), 
    total_price: rand(500..5000), 
    status: %w[accepted pending].sample,
    developer: Developer.all.sample,
    renter: User.first
  )
  booking.save!
  puts booking


end
5.times do
  booking = Booking.new(
    project_name: Faker::Game.title, 
    start_date: Date.today-rand(10000), 
    end_date: Date.today+rand(10000), 
    total_price: rand(500..5000), 
    status: %w[accepted pending].sample,
    developer: User.first.developers.sample,
    renter: User.all.sample
  )
  booking.save!
  puts booking
end

# REVIEW ############################ 
Review.destroy_all
20.times do
  review = Review.new(
    title: ["good work", "excellent", "could be better", "finished on time AAA +++", "do not recommend"].sample,
    rating: rand(1..5),
    content: "Review sites can be a springboard for content
    ideas – ideas that already reflect something your 
    audience thinks, whether it’s about how to use your 
    product, what features matter, or pain points to overcome.",
    booking: Booking.all.sample
  )
  review.save!
  puts review.title
  puts review.rating
  puts review.content
end

puts "Finish"

# Skill.destroy_all
# Developer_skill.destroy_all
# t.string "project_name"
# t.date "start_date"
# t.date "end_date"
# t.integer "total_price"
# t.bigint "developer_id", null: false
# t.bigint "user_id", null: false
# t.bigint "renter_id"
# t.string "status"
# # SKILL
# name
# # DEVELOPER_SKILL



