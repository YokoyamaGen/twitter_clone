# frozen_string_literal: true

class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true
      t.timestamps
    end
    add_index :bookmarks, %i[user_id tweet_id], unique: true
  end
end
