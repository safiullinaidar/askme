class AddEmailUniquenessToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.index [:email], unique: true
    end
  end
end
