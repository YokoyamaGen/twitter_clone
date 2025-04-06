namespace :tweets do
  desc "Insert 100,000 tweets for user_id 11"
  task bulk_insert: :environment do
    require 'activerecord-import/base'
    require 'activerecord-import/active_record/adapters/postgresql_adapter'

    tweets = []
    100_000.times do
      tweets << Tweet.new(user_id: 11, content: "サンプルコンテンツ", created_at: Time.now, updated_at: Time.now)
    end

    Tweet.import tweets
    puts "10万件のツイートが挿入されました。"
  end
end