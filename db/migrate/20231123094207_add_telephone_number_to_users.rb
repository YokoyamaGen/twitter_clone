class AddTelephoneNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :telephone_number, :string, null: false, default: ''
    add_column :users, :birthday, :datetime, null: false
    add_column :users, :name, :string, null: false, default: ''
  end
end
