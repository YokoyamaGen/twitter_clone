# frozen_string_literal: true

class RenameTweetColumnToTweets < ActiveRecord::Migration[7.0]
  def change
    rename_column :tweets, :tweet, :content
  end
end
