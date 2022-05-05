class AddNicknameUniquenessToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.index [:nickname], unique: true
    end
  end
end
