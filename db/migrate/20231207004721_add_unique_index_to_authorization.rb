# frozen_string_literal: true

class AddUniqueIndexToAuthorization < ActiveRecord::Migration[7.0]
  def change
    add_index :authorizations, %i[uid provider], unique: true
  end
end
