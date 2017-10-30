class CreateLetters < ActiveRecord::Migration[5.1]
  def change
    create_table :letters do |t|
      t.string :address
      t.string :security_token

      t.timestamps
    end
  end
end
