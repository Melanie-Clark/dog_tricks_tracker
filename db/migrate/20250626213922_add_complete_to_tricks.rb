class AddCompleteToTricks < ActiveRecord::Migration[8.0]
  def change
    add_column :tricks, :complete, :boolean
  end
end
