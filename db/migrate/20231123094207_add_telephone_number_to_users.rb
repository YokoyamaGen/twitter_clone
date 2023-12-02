# frozen_string_literal: true

class AddTelephoneNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :telephone_number, null: false, default: ''
      t.datetime :birthday, null: false
      t.string :name, null: false, default: ''
    end
  end
end
