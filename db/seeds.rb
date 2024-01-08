# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Base.connection.execute <<~SQL.squish
  TRUNCATE TABLE users RESTART IDENTITY CASCADE;
  TRUNCATE TABLE tweets RESTART IDENTITY CASCADE;
  TRUNCATE TABLE follows RESTART IDENTITY CASCADE;
SQL

10.times do |i|
  name  = Faker::Name.name
  email = "example-#{i+1}@railstutorial.org"
  birthday = Faker::Date.birthday(min_age: 18, max_age: 65).strftime("%Y%m%d")
  telephone_number = Faker::PhoneNumber.cell_phone
  password = "password"
  user = User.create!(
    email: email,
    name: name,
    birthday: birthday,
    telephone_number: telephone_number,
    password: password,
    password_confirmation: password,
    confirmed_at: '2023-12-03 02:16:02.309221'
  )
end

users = User.order(:created_at)
21.times do
  tweet = Faker::Lorem.paragraph(sentence_count: 5)
  users.each { |user| user.tweets.create!(tweet: tweet) }
end

users = User.all
user = User.first
follower_users = users[1..9]

follower_users.each do |follower_user|
  user.user_followers.create!(followed_id: follower_user.id)
end
