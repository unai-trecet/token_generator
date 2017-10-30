class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.string :address
      t.string :albaran

      t.timestamps
    end
  end
end
