class CreateStamps < ActiveRecord::Migration[5.1]
  def change
    create_table :stamps do |t|
      t.string :price
      t.string :identify

      t.timestamps
    end
  end
end
