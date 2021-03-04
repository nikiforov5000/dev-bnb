require 'faker'

puts "Clean database"

# USER ############################
User.destroy_all
Developer.destroy_all

puts "Destroy Users"
20.times do
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
    puts "--Destroy Developers"
    developer = Developer.new(
      owner: User.last,
      name: Faker::Name.name,
      specialty: %w[PHP JS Ruby Web-Design C++ Pascal].sample,
      age: rand(18..65),
      bio: "A good bio can be used to help find employment
      or establish your credentials as an expert in
      software development. So, a powerful bio is a
      must-have for anyone. Want to see a great
      example? This
      may help you out.
      software developer bio",
      daily_rate: rand(20..200)
    )
    developer.save!
    puts developer.owner
    puts developer.name
    puts developer.specialty
    puts developer.age
    puts developer.bio
    puts developer.daily_rate
  end

end


# BOOKING ##########################
Booking.destroy_all
20.times do
  booking = Booking.new(
    project_name: Faker::Game.title,
    start_date: Date.new,
    end_date: Date.new + 1,
    total_price: rand(500..5000),
    status: %w[accepted pending].sample,
    developer: Developer.all.sample,
    renter: User.all.sample
  )
  booking.save!
  puts booking


end
4.times do
  booking = Booking.new(
    project_name: Faker::Game.title,
    start_date: Date.new,
    end_date: Date.new + 1,
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
    start_date: Date.new,
    end_date: Date.new + 1,
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

Skill.destroy_all
skills = %w[Backend Frontend SQL Rails UX UI Web-Design Git GitHub AJAX PHP JS Ruby C++ Python Matlab]
skills.each do |skill|
  add_skill = Skill.new(name: skill)
  add_skill.save!
  puts add_skill.name
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
