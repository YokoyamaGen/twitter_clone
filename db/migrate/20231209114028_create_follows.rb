# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :follower, foreign_key: { to_table: :users }, null: false
      t.references :followed, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
