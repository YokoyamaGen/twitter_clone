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
  TRUNCATE TABLE comments RESTART IDENTITY CASCADE;
  TRUNCATE TABLE favorites RESTART IDENTITY CASCADE;
  TRUNCATE TABLE retweets RESTART IDENTITY CASCADE;
  TRUNCATE TABLE notifications RESTART IDENTITY CASCADE;
  TRUNCATE TABLE active_storage_attachments RESTART IDENTITY CASCADE;
  TRUNCATE TABLE active_storage_blobs RESTART IDENTITY CASCADE;
  TRUNCATE TABLE active_storage_variant_records RESTART IDENTITY CASCADE;
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
    icon_image: ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join('app/assets/images/computer_blindtouch.png')), filename: 'computer_blindtouch'
    ),
    header_image: ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join('app/assets/images/ruby.jpeg')), filename: 'ruby'
    ),
    website: 'https://test.jp'
  )
end

users = User.order(:created_at)
21.times do
  tweet = Faker::Lorem.paragraph(sentence_count: 5)
  users.each { |user| user.tweets.create!(content: tweet) }
end

users = User.all
user = User.first
follower_users = users[1..9]

follower_users.each do |follower_user|
  user.user_followers.create!(followed_id: follower_user.id)
end

all_tweets = Tweet.all
part_tweets = all_tweets[0..9]
users.each do |favorite_user|
  part_tweets.each do |part_tweet|
    favorite_user.favorites.create!(tweet_id: part_tweet.id) unless part_tweet.user.id == favorite_user.id
  end
end

last_tweet = Tweet.last
first_tweet = Tweet.first
users.each do |retweet_comment_user|
  retweet_comment_user.retweets.create!(tweet_id: first_tweet.id)
  comment = Faker::Lorem.paragraph(sentence_count: 5)
  retweet_comment_user.comments.create!(tweet_id: last_tweet.id, content: comment)
end
