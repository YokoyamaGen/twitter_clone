class RemoveIndexFromBookmarksOnTweetId < ActiveRecord::Migration[7.0]
  def change
    remove_index :bookmarks, name: "index_bookmarks_on_tweet_id"
  end
end
