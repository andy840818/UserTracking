# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.find_or_create_by(email: 'bbb@bbb.bbb') do |admin|
  admin.password = 'bbb@bbb.bbb'
  admin.password_confirmation = 'bbb@bbb.bbb'
end

5.times do |i|
  User.create!(
    email: Faker::Internet.email,
    password: 'aaa@aaa.aaa',
    password_confirmation: 'aaa@aaa.aaa',
    name: Faker::Name.name,
    last_active_at: rand(1..30).days.ago
  )
end

User.all.each do |user|
  rand(1..5).times do
    booking = Booking.create!(
      user: user,
      status: rand(0..1),
      content: Faker::Lorem.sentence,
      created_at: rand(1..30).days.ago,
      booking_period: rand(100..1200)
    )

    ActivityTracking.create!(
      user: user,
      action_type: "Submit",
      action_params: booking.content,
      timestamp: booking.created_at,
      booking: booking
    )
  end
end

(1..30).each do |day|
  DailyStatistic.create!(
    date: day.days.ago.to_date,
    active_users: rand(1..5),
    booking_number: rand(1..10),
    average_booking_period: rand(10..120).to_f,
    percentile_99th_booking_period: rand(100..120).to_f,
    maximum_booking_period: rand(120..140).to_f
  )
end

(1..4).each do |week|
  start_date = (week * 7).days.ago.to_date
  end_date = start_date + 6.days

  WeeklyStatistic.create!(
    active_users: rand(1..5),
    booking_number: rand(1..20),
    start_date: start_date,
    end_date: end_date
  )
end

puts 'Seed data created successfully!'
