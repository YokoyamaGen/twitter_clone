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
  email = "example-#{i + 1}@railstutorial.org"
  birthday = Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%Y%m%d')
  telephone_number = Faker::PhoneNumber.cell_phone
  password = 'password'
  User.create!(
    email:,
    name:,
    birthday:,
    telephone_number:,
    password:,
    password_confirmation: password,
    confirmed_at: '2023-12-03 02:16:02.309221',
    self_introduction: '埼玉県でWEBエンジニアをしております。Rails、Vue.js',
    location: '埼玉県 さいたま市',
    icon_image: 'https://3.bp.blogspot.com/-ofY9lgJFb7E/VixB0G8i-DI/AAAAAAAA0FQ/Rgw7dHzGSK8/s800/computer_blindtouch.png',
    header_image: 'https://nanboya.com/jewelry-kaitori/files/2018/05/purchasecomparison-diamond-ruby-001.jpg',
    website: 'https://test.jp'
  )
end

users = User.order(:created_at)
21.times do
  tweet = Faker::Lorem.paragraph(sentence_count: 5)
  users.each { |user| user.tweets.create!(tweet:) }
end

users = User.all
user = User.first
follower_users = users[1..9]

follower_users.each do |follower_user|
  user.user_followers.create!(followed_id: follower_user.id)
end

last_tweet = Tweet.last
users.each do |favorite_user|
  favorite_user.favorites.create!(tweet_id: last_tweet.id)
end

first_tweet = Tweet.first
users.each do |retweet_comment_user|
  retweet_comment_user.retweets.create!(tweet_id: first_tweet.id)
  comment = Faker::Lorem.paragraph(sentence_count: 5)
  retweet_comment_user.comments.create!(tweet_id: last_tweet.id, content: comment)
end
