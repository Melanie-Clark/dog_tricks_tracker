class CreateTricks < ActiveRecord::Migration[8.0]
  def change
    create_table :tricks do |t|
      t.string :name

      t.timestamps
    end
  end
end
